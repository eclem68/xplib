{$IFDEF TREUtils}
    {$DEFINE DEBUG_UNIT}
{$ENDIF}
{$I TRELib.inc}

unit TREUtils;

interface

uses
    SysUtils, Windows, Classes, TREConsts;


type
    ETREException = class(Exception);

type
    TTREUtils = class
    public
        class procedure CheckComputername(const Name : string); overload;
        class procedure CheckComputername(const Name : string; Local : Integer); overload;
        class procedure CheckComputername(const Name : string; ComputerType : TTREComputerType); overload;
        class procedure CheckComputername(const Name : string; Local : Integer; ComputerType : TTREComputerType); overload;
        class procedure CheckComputername(const Name : string; Local, CompId : Integer; ComputerType : TTREComputerType); overload;
        class function GetComputerZone(const Computername : string) : Integer;
        class function GetNetworkType(const ComputerName : string) : TTRENetType;
    end;

implementation

uses
    StrHnd, Str_Pas;

{ TTREUtils }

class procedure TTREUtils.CheckComputername(const Name : string; Local : Integer);
begin
    CheckComputername(Name, Local, ctAny);
end;

class procedure TTREUtils.CheckComputername(const Name : string);
begin
    CheckComputername(Name, CMPNAME_LOCAL_ALL, ctAny);
end;

class procedure TTREUtils.CheckComputername(const Name : string; Local, CompId : Integer; ComputerType : TTREComputerType);
var
    prefixFound, prefixExpected : char;
    prefixLen, localInt, IdInt, idBias : Integer;
    localStr, IdStr : string;
    typeFound : TTREComputerType;
begin
    //Checa o tipo do computador
    prefixFound := Str_Pas.GetIChar(UpperCase(Name), 1);
    case ComputerType of
        ctCentralPDC, ctCentralWKS : begin
            prefixExpected := CMPNAME_LOCAL_CENTRAL;
        end;
        ctZonePDC, ctZoneWKS : begin
            prefixExpected := CMPNAME_LOCAL_ZONE;
        end;
        ctTREWKS : begin
            prefixExpected := CMPNAME_LOCAL_REGIONAL;
        end;
        ctVirtual : begin
            prefixExpected := CMPNAME_LOCAL_REGIONAL;
        end;
        ctAny : begin
            prefixExpected := prefixFound;
        end;
        else begin
            raise ETREException.Create('Tipo do computador desconhecido');
        end;
    end;
    if (prefixFound <> prefixExpected) then begin
        raise ETREException.CreateFmt('Tipo de computador encontrado "%s" diverge do desejado "%s".', [prefixFound, prefixExpected
            ]);
    end;

    //Calcula o comprimento do prefixo encontrado
    case prefixFound of
        CMPNAME_LOCAL_ZONE : begin
            prefixLen := 3;
            idBias    := PrefixLen + CMPNAME_LOCAL_LENGHT + CMPNAME_TYPE_LENGHT;
            if (Pos(CMPNAME_TYPE_DOMAIN_CONTROLLER, Name) > 0) then begin
                typeFound := ctZonePDC;
            end else begin
                typeFound := ctZoneWKS;
            end;
        end;
        CMPNAME_LOCAL_CENTRAL : begin
            prefixLen := 3;
            idBias    := PrefixLen + CMPNAME_LOCAL_LENGHT + CMPNAME_TYPE_LENGHT;
            if (Pos(CMPNAME_TYPE_DOMAIN_CONTROLLER, Name) > 0) then begin
                typeFound := ctCentralPDC;
            end else begin
                typeFound := ctCentralWKS;
            end;
        end;
        CMPNAME_LOCAL_REGIONAL : begin
            prefixLen := 4;
            idBias    := PrefixLen + CMPNAME_LOCAL_LENGHT + CMPNAME_TYPE_LENGHT;
            typeFound := ctTREWKS;
            { TODO -oroger -cdsg : Para identificar se a m�quina � virtual n�o existe modo seguro }
        end;
        else begin
            raise ETREException.CreateFmt('Imposs�vel validar nome de computador para prefixo/tipo "%s"', [prefixFound]);
        end;
    end;

    //Checa o local do computador
    if ((Local <> CMPNAME_LOCAL_ANY) and (Local <> CMPNAME_LOCAL_ALL)) then begin
        localStr := Copy(Name, prefixLen, CMPNAME_LOCAL_LENGHT);
        try
            localInt := StrToInt(localStr);
            if (localInt <> Local) then begin
                raise ETREException.Create('Local/Zona do computador diverge do esperado.');
            end;
        except
            on E : Exception do begin
                raise ETREException.CreateFmt('Local/Zona do computador "%s" inv�lido.'#13'%s', [localStr, E.Message]);
            end;
        end;
    end;

    //checa o id do computador
    IdStr := System.Copy(Name, idBias+1, Length(Name));
    try
        IdInt := StrToInt(IdStr);
        if ((CompId <> CMPNAME_ID_ALL) and (CompId <> CMPNAME_ID_ANY) and (CompId <> IdInt)) then begin
            raise ETREException.CreateFmt('O identificador da esta��o esperado "%d" diverge do encontrado "%d".', [CompId, IdInt]
                );
        end;
    except
        on E : Exception do begin
            raise ETREException.CreateFmt('A string "%s" n�o representa um identificador de esta��o v�lido.'#13'%s', [IdStr,
                E.Message]);
        end;
    end;

    //tipo do computador
    if ((ComputerType <> ctAny) and (ComputerType <> typeFound)) then begin
        raise ETREException.Create('Tipo do computador encontrado diverge do esperado');
    end;

end;

class procedure TTREUtils.CheckComputername(const Name : string; ComputerType : TTREComputerType);
begin
    CheckComputername(Name, CMPNAME_LOCAL_ALL, ComputerType);
end;

class procedure TTREUtils.CheckComputername(const Name : string; Local : Integer; ComputerType : TTREComputerType);
begin
    CheckComputername(Name, Local, CMPNAME_ID_ANY, ComputerType);
end;

class function TTREUtils.GetComputerZone(const Computername : string) : Integer;
{{
Leitura da zona do computador baseado em seu nome

PRE: Computername no formato de nome de computador de zona eleitoral

Revision: 1/6/2008 - roger
}
const
    CMPNAME_LOCAL_POS = 4; { TODO -oroger -clib : Levar para TREConsts }
var
    zone : string;
begin
    zone   := Copy(Computername, CMPNAME_LOCAL_POS, CMPNAME_LOCAL_LENGHT);
    Result := StrToInt(zone);
end;

class function TTREUtils.GetNetworkType(const ComputerName : string) : TTRENetType;
begin
    if (Pos(CMPNAME_TYPE_WORKGROUP, ComputerName) > 0) then begin   //Rede workgroup
        Result := ntWorkGroup;
    end else begin
        if ( (Pos(CMPNAME_TYPE_DOMAIN, ComputerName) > 0 ) or (Pos(CMPNAME_TYPE_DOMAIN_CONTROLLER, ComputerName) > 0)) then begin
            Result := ntDomain;
        end else begin
            raise ETREException.CreateFmt('"%s" n�o representa um nome de computador v�lido para uma zona eleitoral', [
              ComputerName]);
        end;
    end;
end;

end.
