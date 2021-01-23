object TFmGDIImage: TTFmGDIImage
  Left = 0
  Top = 0
  Caption = 'GDIImage'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 447
    Height = 160
    Align = alClient
    TabOrder = 0
    object Image: TImage
      Left = 48
      Top = 27
      Width = 105
      Height = 105
      Proportional = True
      Stretch = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 160
    Width = 447
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 120
    ExplicitWidth = 185
    DesignSize = (
      447
      41)
    object Label1: TLabel
      Left = 221
      Top = 14
      Width = 62
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Zoom: 100%'
    end
    object TrackBar1: TTrackBar
      Left = 297
      Top = 6
      Width = 150
      Height = 30
      Anchors = [akRight, akBottom]
      Max = 20
      Min = 1
      Position = 10
      SelEnd = 20
      SelStart = 1
      ShowSelRange = False
      TabOrder = 0
      OnChange = TrackBar1Change
    end
    object BtGirarHorario: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Girar'
      TabOrder = 1
      OnClick = BtGirarHorarioClick
    end
    object BtGirarAntiHorario: TButton
      Left = 89
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Girar'
      TabOrder = 2
      OnClick = BtGirarAntiHorarioClick
    end
  end
end
