object RadioDlgFrm: TRadioDlgFrm
  Left = 353
  Top = 259
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 192
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TPanel
    Left = 0
    Top = 139
    Width = 310
    Height = 53
    Align = alBottom
    Caption = 'PanelBottom'
    TabOrder = 1
    object CancelBtn: TBitBtn
      Left = 113
      Top = 14
      Width = 83
      Height = 26
      Caption = '&Cancel'
      TabOrder = 0
      Kind = bkCancel
    end
    object HlpBtn: TBitBtn
      Left = 204
      Top = 14
      Width = 83
      Height = 26
      TabOrder = 1
      Kind = bkHelp
    end
    object OkBtn: TBitBtn
      Left = 23
      Top = 14
      Width = 83
      Height = 26
      Caption = '&OK'
      TabOrder = 2
      Kind = bkOK
    end
  end
  object RadioGroup: TRadioGroup
    Left = 0
    Top = 0
    Width = 310
    Height = 139
    Align = alClient
    TabOrder = 0
    TabStop = True
  end
end
