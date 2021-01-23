unit UGDIImage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Jpeg, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls,IGDIPlus;

type
  TTFmGDIImage = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    Image: TImage;
    Label1: TLabel;
    BtGirarHorario: TButton;
    BtGirarAntiHorario: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure BtGirarHorarioClick(Sender: TObject);
    procedure BtGirarAntiHorarioClick(Sender: TObject);
  private
    { Private declarations }
      // Needed to install https://github.com/jackdp/IGDIPlusMod library
      GPImage: IGPImage;
      MStream: TMemoryStream;
      procedure LoadImage();
      procedure Girar(Giro: TIGPRotateFlipType);
  public
    { Public declarations }
  end;

var
  TFmGDIImage: TTFmGDIImage;

implementation

{$R *.dfm}
uses ActiveX;


procedure TTFmGDIImage.BtGirarAntiHorarioClick(Sender: TObject);
begin
  Girar(TIGPRotateFlipType.Rotate90FlipXY);
end;

procedure TTFmGDIImage.BtGirarHorarioClick(Sender: TObject);
begin
  Girar(TIGPRotateFlipType.Rotate90FlipNone);
end;

procedure TTFmGDIImage.FormCreate(Sender: TObject);
var
  StreamInf: IStream;
begin
  Image.Top := 0;
  Image.Left := 0;
  MStream := TMemoryStream.Create;
  MStream.LoadFromFile('C:\ProjetosDelphi\GDIImage\imagem.jpg');
  StreamInf := TStreamAdapter.Create(MStream);
  GPImage := TIGPImage.Create(StreamInf);
  Image.Width := GPImage.Width;
  Image.Height := GPImage.Height;
  LoadImage();
  TrackBar1.SetTick(10);
end;

procedure TTFmGDIImage.FormDestroy(Sender: TObject);
begin
  MStream.Free();
end;

procedure TTFmGDIImage.Girar(Giro: TIGPRotateFlipType);
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
    Graphics := TIGPGraphics.Create(Image.Canvas.Handle);
    Graphics.DrawImage(GPImage, 0, 0, Image.Width, Image.Height);
  end;

end;

procedure TTFmGDIImage.TrackBar1Change(Sender: TObject);
var
  Zoom: Integer;
begin
    Zoom := TrackBar1.Position * 10;
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
    Graphics := TIGPGraphics.Create(Image.Canvas.Handle);
    Graphics.DrawImage(GPImage, 0, 0, Image.Width, Image.Height);
  end;
end;

end.
