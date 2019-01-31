object frmRealizarPedido: TfrmRealizarPedido
  Left = 271
  Top = 127
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Realizar Pedido'
  ClientHeight = 517
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 2
    Width = 449
    Height = 81
    Caption = 'N'#250'mero '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 53
      Top = 10
      Width = 51
      Height = 29
      Caption = 'DDD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 10
      Width = 97
      Height = 29
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 328
      Top = 8
      Width = 105
      Height = 33
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object meDDD: TMaskEdit
      Left = 53
      Top = 40
      Width = 57
      Height = 37
      EditMask = '!99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
    end
    object meTelefone: TMaskEdit
      Left = 136
      Top = 40
      Width = 167
      Height = 37
      EditMask = '!99999999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 1
    end
    object Button6: TButton
      Left = 328
      Top = 43
      Width = 105
      Height = 33
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button6Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 96
    Width = 585
    Height = 89
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 32
      Top = 27
      Width = 46
      Height = 16
      Caption = 'Nome:'
    end
    object Label4: TLabel
      Left = 8
      Top = 56
      Width = 72
      Height = 16
      Caption = 'Endere'#231'o:'
    end
    object dbeIdCliente: TDBEdit
      Left = 408
      Top = 8
      Width = 41
      Height = 24
      DataField = 'Id_Cliente'
      DataSource = dsClientes
      ReadOnly = True
      TabOrder = 0
      Visible = False
    end
    object dbeNomeCliente: TDBEdit
      Left = 80
      Top = 24
      Width = 497
      Height = 24
      DataField = 'Nome'
      DataSource = dsClientes
      ReadOnly = True
      TabOrder = 1
    end
    object dbeEndereco: TDBEdit
      Left = 80
      Top = 56
      Width = 497
      Height = 24
      DataField = 'Endereco'
      DataSource = dsClientes
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 200
    Width = 865
    Height = 257
    Caption = 'Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object dbgProdutos: TDBGrid
      Left = 8
      Top = 32
      Width = 313
      Height = 217
      DataSource = dsProdutos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnTitleClick = dbgProdutosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Id_produto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 227
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 45
          Visible = True
        end>
    end
    object sgProdutosPedidos: TStringGrid
      Left = 352
      Top = 32
      Width = 505
      Height = 209
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      TabOrder = 1
    end
    object Button2: TButton
      Left = 319
      Top = 72
      Width = 33
      Height = 25
      Caption = '->'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 319
      Top = 112
      Width = 33
      Height = 25
      Caption = '<-'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 319
      Top = 152
      Width = 33
      Height = 25
      Caption = '<<-'
      TabOrder = 4
      OnClick = Button5Click
    end
  end
  object Button4: TButton
    Left = 320
    Top = 472
    Width = 193
    Height = 33
    Caption = 'Concluir Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object GroupBox4: TGroupBox
    Left = 472
    Top = 2
    Width = 153
    Height = 81
    Caption = 'Conex'#227'o com Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object ePorta: TEdit
      Left = 32
      Top = 24
      Width = 89
      Height = 21
      MaxLength = 4
      TabOrder = 0
      Text = 'COM4'
    end
    object bConectar: TButton
      Left = 30
      Top = 48
      Width = 90
      Height = 25
      Caption = 'Conectar'
      TabOrder = 1
      OnClick = bConectarClick
    end
  end
  object dsClientes: TDataSource
    DataSet = DataModule1.tbClientesPedidos
    Left = 376
    Top = 8
  end
  object dsProdutos: TDataSource
    DataSet = DataModule1.tbProdutos
    Left = 112
    Top = 200
  end
  object Query1: TQuery
    DatabaseName = 'DataBase'
    Left = 416
    Top = 200
  end
end
