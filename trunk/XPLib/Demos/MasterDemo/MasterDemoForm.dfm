object MasterDemoFrm: TMasterDemoFrm
  Left = 207
  Top = 198
  Width = 783
  Height = 540
  Caption = 'XPLibDemo Application'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 32
    Width = 97
    Height = 25
    Caption = 'CtrlsHnd Demo'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 32
    Width = 89
    Height = 25
    Caption = 'AppLogDemo'
    TabOrder = 1
    OnClick = Button2Click
  end
  object BtnFileHnd: TButton
    Left = 264
    Top = 32
    Width = 75
    Height = 25
    Caption = 'FileHndDemo'
    TabOrder = 2
    OnClick = BtnFileHndClick
  end
  object BtnWinReg: TButton
    Left = 360
    Top = 32
    Width = 75
    Height = 25
    Caption = 'WinRegDemo'
    TabOrder = 3
    OnClick = BtnWinRegClick
  end
end
