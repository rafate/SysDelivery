unit lMonitoraICBox;

interface

uses Classes, iRealizarPedido;

type
 TMonitorICBox = class(TThread)
  protected
    procedure Execute; override;
    procedure MonitoraIcBox;

  end;

implementation

uses SysUtils;




{ TMonitorICBox }


procedure TMonitorICBox.Execute;
 //var
  //contador: integer;

  begin
    Priority := tpLower;
    while(true) do
    begin
     if  (iRealizarPedido.Conectado)
       then
       begin
          MonitoraIcBox();
       Sleep(1000);
      end;
        inherited;
    end;
 end;
    // muda o valor no form1 Form1.ProgressBar1.\max := 10000;

    //faz o loop

   procedure TMonitorICBox.MonitoraIcBox();
 var
   valor: String ;
 begin
   valor :=  iRealizarPedido.frmRealizarPedido.LocalCheckIcBox(100);
   if (Trim(valor) <> '')
     then
       iRealizarPedido.frmRealizarPedido.NumeroChamando(valor);


 end;
end.
