unit UGDIImage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Jpeg, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls,GDIPlus, ActiveX;

type
  TTFmGDIImage = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    TbZoom: TTrackBar;
    Image: TImage;
    Label1: TLabel;
    BtGirarHorario: TButton;
    BtGirarAntiHorario: TButton;
    TbBrilho: TTrackBar;
    TbContrast: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TbZoomChange(Sender: TObject);
    procedure BtGirarHorarioClick(Sender: TObject);
    procedure BtGirarAntiHorarioClick(Sender: TObject);
    procedure TbBrilhoChange(Sender: TObject);
  private
    { Private declarations }
      // Needed to install https://github.com/jackdp/GDIPlus-Library-for-Delphi-and-Lazarus#delphi library
      //
      StreamInf: IStream;
      GPImage: IGPImage;
      MStream: TMemoryStream;
      procedure LoadImage();
      procedure Girar(Giro: TGPRotateFlipType);
      procedure SetBrilhoContrast(pBrilho, pContrast: Integer);
  public
    { Public declarations }
  end;

var
  TFmGDIImage: TTFmGDIImage;

implementation

{$R *.dfm}


procedure TTFmGDIImage.BtGirarAntiHorarioClick(Sender: TObject);
begin
  Girar(TGPRotateFlipType.Rotate90FlipXY);
end;

procedure TTFmGDIImage.BtGirarHorarioClick(Sender: TObject);
begin
  Girar(TGPRotateFlipType.Rotate90FlipNone);
end;

procedure TTFmGDIImage.FormCreate(Sender: TObject);
begin
  Image.Top := 0;
  Image.Left := 0;
  MStream := TMemoryStream.Create;
//  MStream.LoadFromFile('C:\ProjetosDelphi\GDIImage\imagem.jpg');
  MStream.LoadFromFile('C:\ProjetosDelphi\GDIImage\mickey.png');
  StreamInf := TStreamAdapter.Create(MStream);
  GPImage := TGPImage.Create(StreamInf);
  Image.Width := GPImage.Width;
  Image.Height := GPImage.Height;
  LoadImage();
  TbZoom.SetTick(10);
end;

procedure TTFmGDIImage.FormDestroy(Sender: TObject);
begin
  MStream.Free();
end;

procedure TTFmGDIImage.Girar(Giro: TGPRotateFlipType);
var
  Graphics       : IGPGraphics;
  WidthAux : Integer;
  HeightAux : Integer;
begin
  if assigned(GPImage) then
  begin
    Image.Picture := nil;
    HeightAux := Image.Height;
    WidthAux := Image.Width;
    Image.Width := HeightAux;
    Image.Height := WidthAux;
    GPImage.RotateFlip(Giro);
    Graphics := TGPGraphics.Create(Image.Canvas.Handle);
    Graphics.DrawImage(GPImage, 0, 0, Image.Width, Image.Height);
  end;

end;

procedure TTFmGDIImage.TbBrilhoChange(Sender: TObject);
begin
  SetBrilhoContrast(TbBrilho.Position, TbContrast.Position);
end;

procedure TTFmGDIImage.TbZoomChange(Sender: TObject);
var
  Zoom: Integer;
begin
    Zoom := TbZoom.Position;
    Label1.Caption := 'Zoom: ' + IntToStr(Zoom) + '%';
    Image.Width := Zoom * GPImage.Width div 100;
    Image.Height := Zoom * GPImage.Height div 100;
    LoadImage();
end;

procedure TTFmGDIImage.LoadImage();
var
  Graphics       : IGPGraphics;
begin
  if assigned(GPImage) then
  begin
    Image.Picture := nil;
    Graphics := TGPGraphics.Create(Image.Canvas.Handle);
    Graphics.DrawImage(GPImage, 0, 0, Image.Width, Image.Height);
  end;
end;

procedure TTFmGDIImage.SetBrilhoContrast(pBrilho, pContrast: Integer);
var
  Graphics          : IGPGraphics;
  Bitmap            : IGPBitmap;
  BrightnessContrast: IGPBrightnessContrast;
  Params            : TGPBrightnessContrastParams;
begin
  Image.Picture := nil;
  Bitmap        := TGPBitmap.Create(StreamInf);
  Graphics      := TGPGraphics.Create(Image.Canvas.Handle);

  BrightnessContrast            := TGPBrightnessContrast.Create;
  Params.BrightnessLevel        := pBrilho;
  Params.ContrastLevel          := pContrast;
  BrightnessContrast.Parameters := Params;

  Bitmap.ApplyEffect(BrightnessContrast);
  Graphics.DrawImage(Bitmap, 0, 0, Image.Width, Image.Height);
  GPImage := Bitmap;
end;

end.
