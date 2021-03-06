unit iCadastrClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmCadastroClientes = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    dbeNome: TDBEdit;
    dsClientes: TDataSource;
    Label2: TLabel;
    dbeTelefone: TDBEdit;
    Label3: TLabel;
    dbeEndereco: TDBEdit;
    dbgClientes: TDBGrid;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgClientesTitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

uses uDataModule;

{$R *.dfm}

procedure TfrmCadastroClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := caFree;
frmCadastroClientes := nil;
end;

procedure TfrmCadastroClientes.dbgClientesTitleClick(Column: TColumn);
begin
DataModule1.tbClientes.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadastroClientes.Button1Click(Sender: TObject);
begin
showmessage(dbgClientes.Fields[0].AsString);
if DataModule1.tbPedidos.Locate('Id_Cliente',dbgClientes.Fields[0].AsInteger,[]) = true then
  begin
  showmessage('existe');
  abort;
  end;
showmessage('nao existe');  
end;

procedure TfrmCadastroClientes.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
If Button = nbDelete then
  begin
    if DataModule1.tbPedidos.Locate('Id_Cliente',dbgClientes.Fields[0].AsInteger,[]) = true then
      begin
        showmessage('N�o � poss�vel excluir este cliente porque ele j� realizou pedidos.');
        abort;
      end;
    If MessageDlg('Confirma a exclus�o do registro atual?', mtWarning, [mbYes, mbNo], 0) = mrno  Then
      Abort;
  end;
end;

end.
