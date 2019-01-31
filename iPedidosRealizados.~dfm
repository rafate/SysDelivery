object frmPedidosRealizados: TfrmPedidosRealizados
  Left = 478
  Top = 126
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos Realizados'
  ClientHeight = 491
  ClientWidth = 477
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
    Left = 0
    Top = 0
    Width = 477
    Height = 89
    Align = alTop
    Caption = 'Filtros'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 27
      Width = 35
      Height = 13
      Caption = 'Cliente:'
    end
    object Label2: TLabel
      Left = 24
      Top = 60
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label3: TLabel
      Left = 136
      Top = 60
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object eCliente: TEdit
      Left = 48
      Top = 24
      Width = 289
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object Button1: TButton
      Left = 376
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object meDataIni: TMaskEdit
      Left = 48
      Top = 56
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = meDataIniExit
    end
    object meDataFim: TMaskEdit
      Left = 168
      Top = 56
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnExit = meDataFimExit
    end
    object bExcluir: TButton
      Left = 376
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 336
    Width = 477
    Height = 155
    Align = alBottom
    Caption = 'Produtos Pedidos'
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 473
      Height = 138
      Align = alClient
      DataSource = DataSource2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 89
    Width = 477
    Height = 247
    Align = alClient
    Caption = 'Pedidos'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 473
      Height = 230
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 264
  end
  object Query1: TQuery
    AfterScroll = Query1AfterScroll
    DatabaseName = 'SysDelivery'
    SQL.Strings = (
      
        'select id_pedido as Pedido, data_pedido as Data,nome as Nome,id_' +
        'cliente '
      
        'from pedidos inner join clientes on pedidos.id_cliente = cliente' +
        's.id_cliente '
      'order by data_pedido desc')
    Left = 296
    object Query1Pedido: TIntegerField
      FieldName = 'Pedido'
      Origin = 'SYSDELIVERY."Pedidos.DB".Id_Pedido'
    end
    object Query1Data: TDateTimeField
      FieldName = 'Data'
      Origin = 'SYSDELIVERY."Pedidos.DB".Data_Pedido'
    end
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Origin = 'SYSDELIVERY."Clientes.DB".Nome'
      Size = 80
    end
    object Query1id_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'SYSDELIVERY."Pedidos.DB".Id_Cliente'
    end
  end
  object Query2: TQuery
    DatabaseName = 'SysDelivery'
    Left = 328
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 232
  end
end
