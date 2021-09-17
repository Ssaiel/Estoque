object frmTipoOrdemCompra: TfrmTipoOrdemCompra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tipo de Ordem de Compra'
  ClientHeight = 119
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 24
    Top = 81
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 145
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 24
    Width = 196
    Height = 41
    Columns = 2
    Items.Strings = (
      'Compras'
      'Servi'#231'o')
    TabOrder = 2
  end
end
