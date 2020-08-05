unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, strutils, StdCtrls,
  ExtCtrls, Buttons, CheckBoxThemed, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    ABtnCopy: TBitBtn;
    CheckBoxThemed1: TCheckBoxThemed;
    DBtnCopy: TBitBtn;
    LabelVer: TLabel;
    LabelAlpha: TLabel;
    LabelCopyright: TLabel;
    LabelLink: TLabel;
    OBtnCopy: TBitBtn;
    HBtnCopy: TBitBtn;
    BBtnCopy: TBitBtn;
    EditASCII: TEdit;
    EditDec: TEdit;
    EditOct: TEdit;
    EditHex: TEdit;
    EditBin: TEdit;
    LabelASCII: TLabel;
    LabelDec: TLabel;
    LabelOct: TLabel;
    LabelHex: TLabel;
    LabelBin: TLabel;
    ScrollAlpha: TScrollBar;
    procedure ABtnCopyClick(Sender: TObject);
    procedure BBtnCopyClick(Sender: TObject);
    procedure CheckBoxThemed1Change(Sender: TObject);
    procedure DBtnCopyClick(Sender: TObject);
    procedure EditBinKeyPress(Sender: TObject; var Key: char);
    procedure EditDecKeyPress(Sender: TObject; var Key: char);
    procedure EditDecKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditHexKeyPress(Sender: TObject; var Key: char);
    procedure EditOctKeyPress(Sender: TObject; var Key: char);
    procedure EditOctKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditHexKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditBinKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure HBtnCopyClick(Sender: TObject);
    procedure LabelLinkClick(Sender: TObject);
    procedure LabelVerClick(Sender: TObject);
    procedure OBtnCopyClick(Sender: TObject);
    procedure ScrollAlphaChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.EditDecKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  textf:String;
  t:LongInt;
  os:byte;
begin
  if (EditDec.Text = '') then
  begin
  EditASCII.Text:='';
  EditOct.Text:='';
  EditHex.Text:='';
  EditBin.Text:='';
  exit
  end
  else
        textf:=EditDec.Text;
        os:=8;
        t:=StrToDWord(textf);
        EditOct.Text:=Dec2Numb(t,1,os);
        os:=16;
        EditHex.Text:=Dec2Numb(t,1,os);
        os:=2;
        EditBin.Text:=Dec2Numb(t,1,os);
end;

procedure TForm1.EditBinKeyPress(Sender: TObject; var Key: char);
begin
  if (Key=#8) then exit
  else if (Key<#48) or (Key>#49) then Key:=#0;
end;

procedure TForm1.ABtnCopyClick(Sender: TObject);
begin
  EditASCII.SelectAll;
  EditASCII.CopyToClipboard;
end;

procedure TForm1.BBtnCopyClick(Sender: TObject);
begin
  EditBin.SelectAll;
  EditBin.CopyToClipboard;
end;

procedure TForm1.CheckBoxThemed1Change(Sender: TObject);
begin
  if CheckBoxThemed1.Checked then
    Form1.FormStyle:=fsSystemStayOnTop
    else  Form1.FormStyle:=fsNormal;
end;

procedure TForm1.DBtnCopyClick(Sender: TObject);
begin
  EditDec.SelectAll;
  EditDec.CopyToClipboard;
end;

procedure TForm1.HBtnCopyClick(Sender: TObject);
begin
  EditHex.SelectAll;
  EditHex.CopyToClipboard;
end;

procedure TForm1.LabelLinkClick(Sender: TObject);
begin
  OpenURL('https://github.com/SEVA77');
end;

procedure TForm1.LabelVerClick(Sender: TObject);
begin
  OpenURL('https://github.com/SEVA77/Dec-to-Bin-Converter/releases');
end;

procedure TForm1.OBtnCopyClick(Sender: TObject);
begin
  EditOct.SelectAll;
  EditOct.CopyToClipboard;
end;

procedure TForm1.EditDecKeyPress(Sender: TObject; var Key: char);
begin
  if (Key=#8) then exit
  else if (Key<#48) or (Key>#57) then Key:=#0;
end;

procedure TForm1.EditHexKeyPress(Sender: TObject; var Key: char);
begin
  if (Key=#8) then exit
  else if ((Key<#48) or (Key>#57)) and ((Key<#65) or (Key>#70))
  and ((Key<#97) or (Key>#102)) then Key:=#0;
end;

procedure TForm1.EditOctKeyPress(Sender: TObject; var Key: char);
begin
  if (Key=#8) then exit
  else if (Key<#48) or (Key>#55) then Key:=#0;
end;

procedure TForm1.EditOctKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  textf:String;
  t:longint;
  os:byte;
begin
  if EditOct.Text='' then
  begin
  EditASCII.Text:='';
  EditDec.Text:='';
  EditOct.Text:='';
  EditHex.Text:='';
  EditBin.Text:='';
  exit
  end
  else
        textf:=EditOct.Text;
        os:=8;
        t:=Numb2Dec(textf,os);
        EditDec.Text:=IntToStr(t);
        t:=StrToInt64(EditDec.Text);
        os:=16;
        EditHex.Text:=Dec2Numb(t,1,os);
        os:=2;
        EditBin.Text:=Dec2Numb(t,1,os);
end;

procedure TForm1.EditHexKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  textf:String;
  t:longint;
  os:byte;
begin
  if EditHex.Text='' then
  begin
  EditASCII.Text:='';
  EditDec.Text:='';
  EditOct.Text:='';
  EditHex.Text:='';
  EditBin.Text:='';
  exit
  end
  else
        textf:=EditHex.Text;
        os:=16;
        t:=Numb2Dec(textf,os);
        EditDec.Text:=IntToStr(t);
        t:=StrToInt64(EditDec.Text);
        os:=8;
        EditOct.Text:=Dec2Numb(t,1,os);
        os:=2;
        EditBin.Text:=Dec2Numb(t,1,os);
end;

procedure TForm1.EditBinKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  textf:String;
  t:longint;
  os:byte;
begin
  if EditBin.Text='' then
  begin
  EditASCII.Text:='';
  EditDec.Text:='';
  EditOct.Text:='';
  EditHex.Text:='';
  EditBin.Text:='';
  exit
  end
  else
        textf:=EditBin.Text;
        os:=2;
        t:=Numb2Dec(textf,os);
        EditDec.Text:=IntToStr(t);
        t:=StrToInt64(EditDec.Text);
        os:=8;
        EditOct.Text:=Dec2Numb(t,1,os);
        os:=16;
        EditHex.Text:=Dec2Numb(t,1,os);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.ScrollAlphaChange(Sender: TObject);
begin
  Form1.AlphaBlendValue:=ScrollAlpha.Position;
end;


end.

