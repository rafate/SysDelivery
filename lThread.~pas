unit lThread;

interface

uses
  Classes,iRealizarPedido;

type
  ICBOXThread = class(TThread)
  private
    { Private declarations }
  protected
    _Form: TfrmRealizarPedido;
    procedure Execute; override;
    procedure MonitoraIcBox;

  public
      constructor Create(CreateSuspended: Boolean; AForm: TfrmRealizarPedido);
  end;

implementation

uses SysUtils;

//============================================================================//
constructor ICBOXThread.Create(CreateSuspended: Boolean; AForm: TfrmRealizarPedido);
begin
  inherited Create (CreateSuspended);
  _Form := AForm;
  FreeOnTerminate := false;

end;

{ ICBOXThread }
//============================================================================//
procedure ICBOXThread.Execute;
begin
 Priority := tpLower;
   while(true) do
    begin
     if  (_Form.Conectado)
       then
       begin
        Synchronize(MonitoraIcBox);

      end;
     Sleep(1000);
    end;
end;

//============================================================================//
   procedure ICBOXThread.MonitoraIcBox();
 var
   valor: String ;
 begin
   valor :=  _Form.LocalCheckIcBox(100);
   if (Trim(valor) <> '')
     then
       _Form.NumeroChamando(valor);
 end;

end.


