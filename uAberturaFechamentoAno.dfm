object frmAberturaFechamentoAno: TfrmAberturaFechamentoAno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Abertura/Fechamento Anual'
  ClientHeight = 148
  ClientWidth = 287
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 92
    Height = 13
    Caption = 'Ano de Exerc'#237'cio'
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 72
    Width = 249
    Height = 57
    Caption = ' Op'#231#227'o '
    Columns = 2
    Items.Strings = (
      'Abertura'
      'Fechamento')
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 24
    Width = 113
    Height = 42
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 35
    Width = 92
    Height = 21
    Date = 42054.489163078700000000
    Format = 'yyyy'
    Time = 42054.489163078700000000
    DateMode = dmUpDown
    TabOrder = 2
  end
end
