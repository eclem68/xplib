object fmShellDialogTest: TfmShellDialogTest
  Left = 326
  Top = 208
  BorderStyle = bsDialog
  Caption = 'Shell Dialog Test'
  ClientHeight = 328
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnShellAbout: TBitBtn
    Left = 27
    Top = 70
    Width = 150
    Height = 25
    Caption = 'Display Shell About Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btnShellAboutClick
  end
  object btnBrowseFolders: TBitBtn
    Left = 27
    Top = 30
    Width = 150
    Height = 25
    Caption = 'Display Folder Browse Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnBrowseFoldersClick
  end
  object btnPickIcon: TBitBtn
    Left = 27
    Top = 149
    Width = 150
    Height = 25
    Caption = 'Display Pick Icon Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btnPickIconClick
  end
  object btnFindFiles: TBitBtn
    Left = 27
    Top = 228
    Width = 150
    Height = 25
    Caption = 'Display Find Files Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = btnFindFilesClick
  end
  object btnExitWindows: TBitBtn
    Left = 205
    Top = 109
    Width = 150
    Height = 25
    Caption = 'Display Exit Windows Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = btnExitWindowsClick
  end
  object btnFormatDrive: TBitBtn
    Left = 27
    Top = 109
    Width = 150
    Height = 25
    Caption = 'Display Format Drive Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = btnFormatDriveClick
  end
  object btnRestart: TBitBtn
    Left = 205
    Top = 149
    Width = 150
    Height = 25
    Caption = 'Display Restart Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = btnRestartClick
  end
  object btnObjectProperties: TBitBtn
    Left = 205
    Top = 30
    Width = 150
    Height = 25
    Caption = 'Display Properties Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = btnObjectPropertiesClick
  end
  object btnRunFile: TBitBtn
    Left = 27
    Top = 188
    Width = 150
    Height = 25
    Caption = 'Display Run File Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = btnRunFileClick
  end
  object btnFindComputer: TBitBtn
    Left = 27
    Top = 267
    Width = 150
    Height = 25
    Caption = 'Display Find Computer Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = btnFindComputerClick
  end
  object btnShellMessageBox: TBitBtn
    Left = 205
    Top = 267
    Width = 150
    Height = 25
    Caption = 'Display Shell Message Box'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 10
    OnClick = btnShellMessageBoxClick
  end
  object btnHandleDiskFill: TBitBtn
    Left = 205
    Top = 228
    Width = 150
    Height = 25
    Caption = 'Display Disk Full Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 11
    OnClick = btnHandleDiskFillClick
  end
  object btnNetConnection: TBitBtn
    Left = 205
    Top = 70
    Width = 150
    Height = 25
    Caption = 'Display Net Connection Dialog'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 12
    OnClick = btnNetConnectionClick
  end
  object btnOutOfMemory: TBitBtn
    Left = 205
    Top = 188
    Width = 150
    Height = 25
    Caption = 'Show Out of Memory Box'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 13
    OnClick = btnOutOfMemoryClick
  end
end