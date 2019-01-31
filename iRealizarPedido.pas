unit iRealizarPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids, DBTables;

type
  TfrmRealizarPedido = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    meDDD: TMaskEdit;
    meTelefone: TMaskEdit;
    dsClientes: TDataSource;
    GroupBox2: TGroupBox;
    dbeIdCliente: TDBEdit;
    dbeNomeCliente: TDBEdit;
    Label3: TLabel;
    dbeEndereco: TDBEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    dbgProdutos: TDBGrid;
    dsProdutos: TDataSource;
    sgProdutosPedidos: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Query1: TQuery;
    Button5: TButton;
    Button6: TButton;
    GroupBox4: TGroupBox;
    ePorta: TEdit;
    bConectar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure dbgProdutosTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure bConectarClick(Sender: TObject);


  private
    { Private declarations }
    procedure AdicionaItemGrid(sValorColuna1, sValorColuna2, sValorColuna3, sValorColuna4 : String);
    procedure LimpasgProdutosPedidos();
    procedure LeArquivoINI();
    function AlterouQtdeProdutoPedido(pIdProduto, pValorProduto : string) : boolean;
    function RetornaUltimoId_Pedido() : integer;
    function RetornaUltimoId_PedidoProduto() : integer;
    procedure Limpar();
    procedure Conectar();
    procedure CarregaUltimoPedidoCliente(pIdCliente: string);
  public
    { Public declarations }
    Conectado : Boolean;
    function LocalCheckIcBox(timeOut: Integer) : String;
    procedure NumeroChamando(arg: String);

  end;

var
  frmRealizarPedido: TfrmRealizarPedido;
const
   NOMEDLL = 'IcBox.dll';
var
   Conectado : Boolean;
implementation

uses uDataModule, iCadastrClientes, lThread, {strutils,} inifiles;

var
   _MinhaThread: ICBOXThread;


{$R *.dfm}
function getEvent(retBuffer: pChar ; timeOut: Integer): Integer ; stdcall; external NOMEDLL;
function openCom(retBuffer: pChar ; arg: String): Integer ; stdcall; external NOMEDLL;
function isConnected(): Boolean ; stdcall; external NOMEDLL;
function closeCom(): Boolean ; stdcall; external NOMEDLL;
function getOnHook(): Boolean ; stdcall; external NOMEDLL;

procedure TfrmRealizarPedido.NumeroChamando(arg: String);
var sTipoLigacao: string;
begin
   sTipoLigacao := copy(arg, 23, 1);
  if (sTipoLigacao = 'E') and (getOnHook()) then
    begin
      meDDD.Text := copy(arg, 13, 2);
      meTelefone.Text := copy(arg, 15, 8);
      Button1.Click;
    end;
end;

procedure TfrmRealizarPedido.AdicionaItemGrid(sValorColuna1, sValorColuna2, sValorColuna3, sValorColuna4 : String);
begin
   with sgProdutosPedidos do
   begin
		 Row := RowCount-1;
		 RowCount := RowCount + 1;
		 Cells[0, Row] := sValorColuna1;
		 Cells[1, Row] := sValorColuna2;
 		 Cells[2, Row] := sValorColuna3;
 		 Cells[3, Row] := formatfloat('#0.00',strtofloat(sValorColuna4));
   end;
end;

procedure TfrmRealizarPedido.LimpasgProdutosPedidos();
var I: integer;
begin
For I:= 1 to sgProdutosPedidos.Rowcount -1 do
  begin
    sgProdutosPedidos.Cells[0,I] := '';
    sgProdutosPedidos.Cells[1,I] := '';
    sgProdutosPedidos.Cells[2,I] := '';
    sgProdutosPedidos.Cells[3,I] := '';
  end;
sgProdutosPedidos.RowCount := 2;
end;

procedure TfrmRealizarPedido.LeArquivoINI();
var ArquivoINI: TIniFile;
porta: string;
begin
  ArquivoINI := TIniFile.Create('C:\SysDelivery\telefone.ini');
  eporta.Text := ArquivoINI.ReadString('Configuracoes', 'porta', porta);
  ArquivoINI.Free;
end;

function TfrmRealizarPedido.AlterouQtdeProdutoPedido(pIdProduto, pValorProduto : string) : boolean;
var i : integer;
bRetorno: boolean;
begin
  bRetorno := false;
  For I:= 1 to sgProdutosPedidos.Rowcount -1 do
    begin
       if pIdProduto =  sgProdutosPedidos.Cells[2,I] then
         begin
           sgProdutosPedidos.Cells[1,I] := inttostr(strtoint(sgProdutosPedidos.Cells[1,I])+1);
           sgProdutosPedidos.Cells[3,I] := formatfloat('#0.00',strtofloat(sgProdutosPedidos.Cells[3,I])+strtofloat(pValorProduto));
           bRetorno := true;
         end;
    end;
    result := bRetorno;
end;

function TfrmRealizarPedido.RetornaUltimoId_Pedido() : integer;
begin
query1.SQL.Clear;
Query1.SQL.Text := 'Select MAX(Id_Pedido) from Pedidos';
Query1.Open;
result := Query1.Fields[0].AsInteger;
end;

function TfrmRealizarPedido.RetornaUltimoId_PedidoProduto() : integer;
begin
query1.SQL.Clear;
Query1.SQL.Text := 'Select MAX(Id_Pedido_Produto) from Pedido_Produto';
Query1.Open;
result := Query1.Fields[0].AsInteger;
end;

procedure TfrmRealizarPedido.Limpar();
begin
  meDDD.Text := '';
  meTelefone.Text := '';
  GroupBox3.Caption := 'Pedido';
  DataModule1.tbClientesPedidos.Filter := 'DDD = 0 and Telefone = 0';
  LimpasgProdutosPedidos();
end;

procedure TfrmRealizarPedido.Conectar();
var
  resultado: String;
  porta: String;
  retorno : pChar;
  size :Integer;
begin
 try
 retorno := StrAlloc(10);
 if (isConnected())
  then
    begin
    if(closeCom())
     then
      begin
       bConectar.Caption := 'Conectar';
       Conectado := false;
      end;
    end
  else
    begin
      porta := Trim(ePorta.Text);
      if (porta = '')
      then
        begin
         ShowMessage('Selecione ou digite uma porta COM válida');
         Exit;
        end;
        size := openCom(retorno, porta);
        if(size >0)
         then
           begin
            resultado := PChar(retorno);
           end;
      if(resultado = '')
        then
          begin
           bConectar.Caption := 'Desconectar';
           Conectado :=  true;
         end
        else
         begin
          ShowMessage(resultado);
         end;
    end;
 except
   on E : Exception  do
         ShowMessage(E.Message);
     else
     begin
     ShowMessage('Erro ao realizar a operação');
      Application.Terminate;
      StrDispose( retorno );
     end;
  end;
       StrDispose( retorno );

end;


procedure TfrmRealizarPedido.CarregaUltimoPedidoCliente(pIdCliente: string);
var
  sUltimoPedidoCliente: string;
begin
  query1.SQL.Clear;
  Query1.SQL.Text := 'Select MAX(Id_Pedido) from Pedidos where Id_Cliente = '+pIdCliente;
  Query1.Open;
  sUltimoPedidoCliente := Query1.Fields[0].AsString;
  if sUltimoPedidoCliente <> '' then
    begin
       query1.SQL.Clear;
       Query1.SQL.Text := 'Select Data_Pedido from Pedidos where Id_Pedido = '+sUltimoPedidoCliente;
       Query1.Open;
       GroupBox3.Caption := 'Pedido - Último pedido em '+Query1.Fields[0].AsString;

       query1.SQL.Clear;
       Query1.SQL.Text := 'Select Descricao, Quantidade, Pedido_Produto.Id_Produto from Pedido_Produto inner join Produtos on Pedido_Produto.Id_Produto = Produtos.Id_Produto where Pedido_Produto.Id_Pedido = '+sUltimoPedidoCliente;
       Query1.Open;
       while not Query1.Eof do
         begin
           AdicionaItemGrid(Query1.Fields[0].AsString, Query1.Fields[1].AsString,Query1.Fields[2].AsString,'0');
           Query1.Next;
         end;
    end;
end;

procedure TfrmRealizarPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := caFree;
frmRealizarPedido := nil;
end;

procedure TfrmRealizarPedido.Button1Click(Sender: TObject);
begin
  try
    DataModule1.tbClientesPedidos.Filter := 'DDD = '+QuotedStr(meDDD.Text)+' and Telefone = '+QuotedStr(meTelefone.Text);
    if dbeIdCliente.Text = '' then
      begin
        if MessageDlg('Cliente não cadastrado! Deseja cadastrar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            if frmCadastroClientes = nil then
              frmCadastroClientes := TfrmCadastroClientes.Create(Application)
            else
              frmCadastroClientes.Show;
            frmCadastroClientes.dbeNome.SetFocus;
            frmCadastroClientes.DBNavigator1.BtnClick(nbInsert);
            frmCadastroClientes.DBEdit1.Text := meDDD.Text;
            frmCadastroClientes.dbeTelefone.Text := meTelefone.Text;
          end;
      end
    else
      begin
         CarregaUltimoPedidoCliente(dbeIdCliente.Text);
      end;

  except
    Application.MessageBox('Digite um DDD e telefone válidos!','Atenção',0);
  end;
end;

procedure TfrmRealizarPedido.dbgProdutosTitleClick(Column: TColumn);
begin
DataModule1.tbProdutos.IndexFieldNames := 'Descricao';
end;

procedure TfrmRealizarPedido.FormCreate(Sender: TObject);
begin
sgProdutosPedidos.Cells[0,0] := 'Produtos Pedidos';
sgProdutosPedidos.Cells[1,0] := 'Qtd';
sgProdutosPedidos.Cells[3,0] := 'Valor';
sgProdutosPedidos.ColWidths[0] := 415;
sgProdutosPedidos.ColWidths[1] := 28;
sgProdutosPedidos.ColWidths[2] := 0;
sgProdutosPedidos.ColWidths[3] := 52;
LeArquivoINI;
_MinhaThread := ICBOXThread.Create (false, Self);
end;

procedure TfrmRealizarPedido.Button2Click(Sender: TObject);
begin
     if AlterouQtdeProdutoPedido(dbgProdutos.Fields[0].AsString, dbgProdutos.Fields[2].AsString) = false then
       begin
       AdicionaItemGrid(dbgProdutos.Fields[1].AsString, '1',dbgProdutos.Fields[0].AsString,dbgProdutos.Fields[2].AsString);
       end;
end;

procedure TfrmRealizarPedido.Button3Click(Sender: TObject);
var i: integer;
begin

with sgProdutosPedidos do
begin
  if RowCount = 3 then
     begin
       if (Cells[1,Row] = '1') or (Cells[1,Row] = '') then
            begin
              if Cells[1,1] = '1' then
                RowCount := RowCount-1;
              Cells[0,Row] := '';
              Cells[1,Row] := '';
              Cells[2,Row] := '';
              Cells[3,Row] := '';
            end
       else
            begin
              Cells[3,Row] := formatfloat('#0.00',strtofloat(Cells[3,Row])-(strtofloat(Cells[3,Row])/strtofloat(Cells[1,Row])));
              Cells[1,Row] := inttostr(strtoint(Cells[1,Row])-1);
            end;
     end;

   if RowCount > 3 then
     begin
       if Cells[1,Row] <> '' then
         begin
           if Cells[1,Row] = '1' then
             begin
               for i := Row to RowCount -2 do //para a penultima receber a ultima
                  begin
                    Cells[0,i] := Cells[0,i+1];
                    Cells[1,i] := Cells[1,i+1];
                    Cells[2,i] := Cells[2,i+1];
                    Cells[3,i] := Cells[3,i+1];
                  end;
               RowCount := RowCount -1; //retira uma linha
             end
           else
             begin
               Cells[3,Row] := formatfloat('#0.00',strtofloat(Cells[3,Row])-(strtofloat(Cells[3,Row])/strtofloat(Cells[1,Row])));
               Cells[1,Row] := inttostr(strtoint(Cells[1,Row])-1);
             end;
         end;
     end;
end;
end;

procedure TfrmRealizarPedido.Button4Click(Sender: TObject);
var I: integer;
begin
if dbeIdCliente.Text = '' then
  begin
    ShowMessage('Cliente não informado!');
    exit;
  end;

if sgProdutosPedidos.Cells[1,1] = '' then
  begin
    ShowMessage('Não foi informado nenhum produto!');
    exit;
  end;

if MessageDlg('Confirma o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DataModule1.tbPedidos.Insert;
    DataModule1.tbPedidos.FieldByName('Id_Cliente').AsString := dbeIdCliente.Text;
    DataModule1.tbPedidos.FieldByName('Data_Pedido').AsString := DateTimeToStr(now);
    DataModule1.tbPedidos.Post;

    For I:= 1 to sgProdutosPedidos.Rowcount do
      begin
        if (sgProdutosPedidos.Cells[3,I] <> '') and (sgProdutosPedidos.Cells[2,I] <> '') and (sgProdutosPedidos.Cells[1,I] <> '') then
        begin
          DataModule1.tbPedidoProduto.Insert;
          DataModule1.tbPedidoProduto.FieldByName('Id_Pedido_Produto').AsInteger := 1+RetornaUltimoId_PedidoProduto();
          DataModule1.tbPedidoProduto.FieldByName('Id_Pedido').AsInteger := RetornaUltimoId_Pedido();
          DataModule1.tbPedidoProduto.FieldByName('Id_Produto').AsString := sgProdutosPedidos.Cells[2,I];
          DataModule1.tbPedidoProduto.FieldByName('Quantidade').AsString := sgProdutosPedidos.Cells[1,I];
          DataModule1.tbPedidoProduto.FieldByName('Valor').AsString := sgProdutosPedidos.Cells[3,I];
          DataModule1.tbPedidoProduto.Post;
        end;
      end;
    ShowMessage('Pedido realizado com sucesso.');
    Limpar();
  end;
end;
procedure TfrmRealizarPedido.Button5Click(Sender: TObject);
begin
  LimpasgProdutosPedidos();
end;

procedure TfrmRealizarPedido.Button6Click(Sender: TObject);
begin
  Limpar();
end;


function TfrmRealizarPedido.LocalCheckIcBox( timeOut: Integer) : String;

 var
 valor :  String;
 retorno : pChar;
 size :Integer;

 begin
   valor := '' ;
   retorno := StrAlloc(47);
   size := getEvent(retorno, timeout);
   if(size >0)
    then
     begin
      valor  := Pchar(retorno);
     end;
  Result :=  valor;
end;

procedure TfrmRealizarPedido.bConectarClick(Sender: TObject);
begin
Conectar();
end;

end.
