object TFmGDIImage: TTFmGDIImage
  Left = 0
  Top = 0
  Caption = 'GDIImage'
  ClientHeight = 284
  ClientWidth = 734
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
    Width = 734
    Height = 243
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 667
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
    Top = 243
    Width = 734
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 667
    DesignSize = (
      734
      41)
    object Label1: TLabel
      Left = 508
      Top = 14
      Width = 62
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Zoom: 100%'
      ExplicitLeft = 221
    end
    object TbZoom: TTrackBar
      Left = 584
      Top = 6
      Width = 150
      Height = 30
      Anchors = [akRight, akBottom]
      Max = 200
      Min = 1
      Position = 100
      SelEnd = 200
      SelStart = 1
      ShowSelRange = False
      TabOrder = 0
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = TbZoomChange
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
    object TbBrilho: TTrackBar
      Left = 170
      Top = 6
      Width = 150
      Height = 25
      Max = 255
      Min = -255
      SelEnd = 255
      SelStart = -255
      ShowSelRange = False
      TabOrder = 3
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = TbBrilhoChange
    end
    object TbContrast: TTrackBar
      Left = 326
      Top = 6
      Width = 150
      Height = 25
      Max = 100
      Min = -100
      SelEnd = 100
      SelStart = -100
      ShowSelRange = False
      TabOrder = 4
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = TbBrilhoChange
    end
  end
end
