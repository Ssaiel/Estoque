object frmCadastroEmpresa: TfrmCadastroEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Cadastro de Empresa - Primeiro Acesso'
  ClientHeight = 328
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 64
    Width = 50
    Height = 13
    Caption = 'Empresa *'
    Color = clBtnFace
    ParentColor = False
  end
  object Label2: TLabel
    Left = 24
    Top = 112
    Width = 34
    Height = 13
    Caption = 'CNPJ *'
  end
  object Label3: TLabel
    Left = 216
    Top = 112
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label4: TLabel
    Left = 24
    Top = 160
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label5: TLabel
    Left = 24
    Top = 208
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label7: TLabel
    Left = 24
    Top = 24
    Width = 173
    Height = 19
    Alignment = taCenter
    Caption = 'Cadastro de Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtEmpresa: TEdit
    Left = 24
    Top = 83
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object edtCnpj: TEdit
    Left = 24
    Top = 131
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object edtCidade: TEdit
    Left = 216
    Top = 131
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object edtEndereco: TEdit
    Left = 24
    Top = 179
    Width = 361
    Height = 21
    TabOrder = 3
  end
  object edtTelefone: TEdit
    Left = 24
    Top = 227
    Width = 169
    Height = 21
    TabOrder = 4
  end
  object btnCadastrar: TButton
    Left = 150
    Top = 272
    Width = 99
    Height = 33
    Caption = 'Cadastrar'
    TabOrder = 5
    OnClick = btnCadastrarClick
  end
end
