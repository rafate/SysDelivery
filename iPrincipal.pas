unit iPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cad1: TMenuItem;
    Produtos1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Clientes1: TMenuItem;
    Pedidos1: TMenuItem;
    RealizarPedido1: TMenuItem;
    PedidosRealizados1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure RealizarPedido1Click(Sender: TObject);
    procedure PedidosRealizados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses iSobre, iCadastroProdutos, uDataModule, iCadastrClientes,
  iRealizarPedido, iPedidosRealizados;

{$R *.dfm}

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
close;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
frmSobre.ShowModal;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  if frmCadastroProdutos = nil then
    frmCadastroProdutos := TfrmCadastroProdutos.Create(Application)
  else
    frmCadastroProdutos.Show;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  if frmCadastroClientes = nil then
    frmCadastroClientes := TfrmCadastroClientes.Create(Application)
  else
    frmCadastroClientes.Show;
end;

procedure TfrmPrincipal.RealizarPedido1Click(Sender: TObject);
begin
  if frmRealizarPedido = nil then
    frmRealizarPedido := TfrmRealizarPedido.Create(Application)
  else
    frmRealizarPedido.Show;
end;

procedure TfrmPrincipal.PedidosRealizados1Click(Sender: TObject);
begin
  if frmPedidosRealizados = nil then
    frmPedidosRealizados := TfrmPedidosRealizados.Create(Application)
  else
    frmPedidosRealizados.Show;
end;

end.
