unit iPedidosRealizados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, Mask;

type
  TfrmPedidosRealizados = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    Query1Pedido: TIntegerField;
    Query1Data: TDateTimeField;
    Query1Nome: TStringField;
    Query1id_cliente: TIntegerField;
    DataSource2: TDataSource;
    eCliente: TEdit;
    Label1: TLabel;
    Button1: TButton;
    meDataIni: TMaskEdit;
    Label2: TLabel;
    meDataFim: TMaskEdit;
    Label3: TLabel;
    bExcluir: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure meDataIniExit(Sender: TObject);
    procedure meDataFimExit(Sender: TObject);
  private
    { Private declarations }
    sSelect, sFrom, sWhere, sOrderBy: string;
    function DataOk(Dt:String):Boolean;
    procedure PesquisarPedido(pCliente, pDataIni, pDataFim: string);
    procedure PesquisarPedidoProduto(pPedido: string);
    procedure ExcluirPedido(pPedido: string);

  public
    { Public declarations }
  end;

var
  frmPedidosRealizados: TfrmPedidosRealizados;

implementation

uses uDataModule;

{$R *.dfm}

function TfrmPedidosRealizados.DataOk(Dt:String):Boolean;
var
  Dia,Mes:Byte;
  Ano:Integer;
      function AnoBissesto(Year :Integer): boolean ;
      begin
         AnoBissesto:=(ano mod 4=0) and ( ano mod 100 <> 0) or (ano Mod 400 =0);
      end;
begin
 Dt:=stringreplace(Dt,'/','',[rfReplaceAll, rfIgnoreCase]);
 Result:=False;
 if length(Trim(Dt)) = 8 then
 begin
        Dia:=StrToIntDef(Copy(Dt,1,2),0);
        Mes:=StrToIntDef(Copy(Dt,4,2),0);
        Ano:=StrToInt(Copy(Dt,7,2));
        if ( (Mes in [1,3,5,7,8,10,12]) and (Dia in [1..31]) ) or
           ( (Mes in [4,6,9,11]) and (Dia in [1..30])        ) or
           ( (Mes = 2) and  (     AnoBissesto(Ano))  and  (Dia in [1..29]) )  or
           ( (Mes = 2) and  (not  AnoBissesto(Ano))  and  (Dia in [1..28]) )
        then
        Result:=True;
 end;
end;

procedure TfrmPedidosRealizados.PesquisarPedido(pCliente, pDataIni, pDataFim: string);
begin
  sSelect := 'select id_pedido as Pedido, data_pedido as Data,nome as Nome,id_cliente ';
  sFrom := 'from pedidos inner join clientes on pedidos.id_cliente = clientes.id_cliente ';
  sWhere := 'where 1=1';
  if (pCliente <> '') then
    sWhere := sWhere+' and nome like ''%'+pCliente+'%''';
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    sWhere := sWhere+' and data_pedido between :dtIni and :dtFim ';
  //((meDataIni.Text <> '__/__/____') and (meDataFim.Text <> '__/__/____'))
  sOrderBy := ' order by data_pedido desc';
  query1.SQL.Clear;
  Query1.SQL.Text := sSelect+sFrom+sWhere+sOrderBy;
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    begin
      query1.ParamByName('dtIni').AsDateTime := StrToDateTime(pDataIni+' 00:00:00');
      query1.ParamByName('dtFim').AsDateTime := StrToDateTime(pDataFim+' 23:59:59');
    end;
  Query1.Active := true;
end;

procedure TfrmPedidosRealizados.PesquisarPedidoProduto(pPedido: string);
begin
  sSelect := 'select quantidade as Quantidade, descricao as Produto ';
  sFrom := 'from pedido_produto inner join produtos on pedido_produto.id_produto = produtos.id_produto ';
  sWhere := 'where id_pedido = '+pPedido;
  query2.SQL.Clear;
  Query2.SQL.Text := sSelect+sFrom+sWhere;
  Query2.Active := true;
end;

procedure TfrmPedidosRealizados.ExcluirPedido(pPedido: string);
var sSQL: string;
begin
  //excluir pedido prouto
  sSQL := 'delete from pedido_produto where id_pedido = '+pPedido;
  query2.SQL.Clear;
  Query2.SQL.Text := sSQL;
  Query2.ExecSQL;
  //excluir pedido
  sSQL := 'delete from pedidos where id_pedido = '+pPedido;
  query2.SQL.Clear;
  Query2.SQL.Text := sSQL;
  Query2.ExecSQL;
end;

procedure TfrmPedidosRealizados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := caFree;
frmPedidosRealizados := nil;
end;

procedure TfrmPedidosRealizados.FormCreate(Sender: TObject);
begin
  PesquisarPedido(eCliente.Text, meDataIni.Text, meDataFim.Text);
end;

procedure TfrmPedidosRealizados.Query1AfterScroll(DataSet: TDataSet);
begin
   PesquisarPedidoProduto(Query1.Fields[0].AsString);
end;

procedure TfrmPedidosRealizados.Button1Click(Sender: TObject);
begin
if MessageDlg('Excluir o pedido selecionado?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
//    showmessage(query1.Fields[0].AsString);
    ExcluirPedido(query1.Fields[0].AsString);
    PesquisarPedido(eCliente.Text, meDataIni.Text, meDataFim.Text);
  end;
end;

procedure TfrmPedidosRealizados.meDataIniExit(Sender: TObject);
begin
if meDataIni.Text <> '  /  /    ' then
    begin
      if not DataOk(meDataIni.Text) then
        begin
          meDataIni.SetFocus;
          ShowMessage('Digite uma data valida!');
        end;
    end;
end;

procedure TfrmPedidosRealizados.meDataFimExit(Sender: TObject);
begin
  if meDataFim.Text <> '  /  /    ' then
    begin
      if not DataOk(meDataFim.Text) then
        begin
          meDataFim.SetFocus;
          ShowMessage('Digite uma data valida!');
        end;
    end;
end;

end.
