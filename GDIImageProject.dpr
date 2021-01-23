program GDIImageProject;

uses
  Vcl.Forms,
  UGDIImage in 'UGDIImage.pas' {TFmGDIImage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTFmGDIImage, TFmGDIImage);
  Application.Run;
end.
