unit iCadastroProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, DB, Mask, Grids, DBGrids;

type
  TfrmCadastroProdutos = class(TForm)
    GroupBox1: TGroupBox;
    DBNavigator1: TDBNavigator;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    dbeDescricaoProduto: TDBEdit;
    dsProdutos: TDataSource;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    dbeValor: TDBEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    { Private declarations }
    //bDescendente: boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

uses uDataModule;

{$R *.dfm}

procedure TfrmCadastroProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := caFree;
frmCadastroProdutos := nil;
end;

procedure TfrmCadastroProdutos.DBGrid1TitleClick(Column: TColumn);
begin
     DataModule1.tbProdutos.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadastroProdutos.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button = nbDelete then
  begin
    if DataModule1.tbPedidoProduto.Locate('Id_Produto',DBGrid1.Fields[0].AsInteger,[]) = true then
      begin
        showmessage('N�o � poss�vel excluir este produto porque ele j� est� em um pedido realizado.');
        abort;
      end;
    If MessageDlg('Confirma a exclus�o do registro atual?', mtWarning, [mbYes, mbNo], 0) = mrno  Then
      Abort;
  end;
end;

end.
