object frmCadastroProdutos: TfrmCadastroProdutos
  Left = 316
  Top = 146
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 271
  ClientWidth = 372
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 372
    Height = 57
    Align = alTop
    Caption = 'Editar Cadastro'
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 15
      Width = 368
      Height = 40
      DataSource = dsProdutos
      Align = alClient
      ConfirmDelete = False
      TabOrder = 0
      BeforeAction = DBNavigator1BeforeAction
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 57
    Width = 372
    Height = 64
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 40
      Height = 13
      Caption = 'Produto:'
      FocusControl = dbeDescricaoProduto
    end
    object Label2: TLabel
      Left = 21
      Top = 42
      Width = 27
      Height = 13
      Caption = 'Valor:'
      FocusControl = dbeDescricaoProduto
    end
    object dbeDescricaoProduto: TDBEdit
      Left = 56
      Top = 14
      Width = 281
      Height = 21
      CharCase = ecUpperCase
      DataField = 'Descricao'
      DataSource = dsProdutos
      TabOrder = 0
    end
    object dbeValor: TDBEdit
      Left = 56
      Top = 40
      Width = 121
      Height = 21
      DataField = 'Valor'
      DataSource = dsProdutos
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 121
    Width = 372
    Height = 150
    Align = alBottom
    Caption = 'Dados'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 368
      Height = 133
      Align = alClient
      DataSource = dsProdutos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Id_produto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 290
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 40
          Visible = True
        end>
    end
  end
  object dsProdutos: TDataSource
    DataSet = DataModule1.tbProdutos
    Left = 344
    Top = 216
  end
end
