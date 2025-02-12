unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, uFrmAtualizaDB, uRelCadCliente, uRelCadClienteFicha;

type
  TfrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    mniCATEGORIA1: TMenuItem;
    mniPRODUTO1: TMenuItem;
    N2: TMenuItem;
    menuFechar: TMenuItem;
    VENDA1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    mniPRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    EMPRESA1: TMenuItem;
    CATEGORIA1: TMenuItem;
    FICHADECLIENTE1: TMenuItem;
    PRODUTOSPORCATEGORIA1: TMenuItem;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniCATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure mniPRODUTO1Click(Sender: TObject);
    procedure VENDA1Click(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure CLIENTE2Click(Sender: TObject);
    procedure FICHADECLIENTE1Click(Sender: TObject);
    procedure mniPRODUTO2Click(Sender: TObject);
    procedure PRODUTOSPORCATEGORIA1Click(Sender: TObject);
    procedure VENDAPORDATA1Click(Sender: TObject);
  private
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategorias, uCadCliente, uCadProduto, uProVendas, uRelCategoria, uRelProduto, uRelProdutoCategoria, uSelecionarData, uRelVendaPorData;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  frmRelCategoria := TfrmRelCategoria.Create(Self);
  frmRelCategoria.Relatorio.PreviewModal;
  frmRelCategoria.Release;
end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCLiente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.CLIENTE2Click(Sender: TObject);
begin
  frmRelCadCliente := TfrmRelCadCliente.Create(Self);
  frmRelCadCliente.Relatorio.PreviewModal;
  frmRelCadCliente.Release;
end;

procedure TfrmPrincipal.FICHADECLIENTE1Click(Sender: TObject);
begin
  frmRelCadClienteFicha := TfrmRelCadClienteFicha.Create(Self);
  frmRelCadClienteFicha.Relatorio.PreviewModal;
  frmRelCadClienteFicha.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmAtualizaDB := TfrmAtualizaDB.Create(Self);
  frmAtualizaDB.Show;
  frmAtualizaDB.Refresh;

  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.ConexaoDB do
  begin
    SQLHourGlass := False;
    Protocol := 'mssql';
    LibraryLocation := 'C:\ProjetosDelphi\ntwdblib.dll';
    HostName := '.\SERVERCURSO';
    Port := 1433;
    User := 'sa';
    Password := 'cursodt';
    Database := 'vendas';
    Connected := True;
  end;

  AtualizacaoBancoDados(frmAtualizaDB);
  frmAtualizaDB.Free;

end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.mniCATEGORIA1Click(Sender: TObject);
begin
  frmCadCategorias := TfrmCadCategorias.Create(Self);
  frmCadCategorias.ShowModal;
  frmCadCategorias.Release;
end;

procedure TfrmPrincipal.mniPRODUTO1Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  frmCadProdutos.ShowModal;
  frmCadProdutos.Release;
end;

procedure TfrmPrincipal.mniPRODUTO2Click(Sender: TObject);
begin
  frmRelProduto := TfrmRelProduto.Create(Self);
  frmRelProduto.Relatorio.PreviewModal;
  frmRelProduto.Release;
end;

procedure TfrmPrincipal.PRODUTOSPORCATEGORIA1Click(Sender: TObject);
begin
  frmRelProdutoCategoria := TfrmRelProdutoCategoria.Create(Self);
  frmRelProdutoCategoria.Relatorio.PreviewModal;
  frmRelProdutoCategoria.Release;
end;

procedure TfrmPrincipal.VENDA1Click(Sender: TObject);
begin
  frmProVendas := TfrmProVendas.Create(Self);
  frmProVendas.ShowModal;
  frmProVendas.Release;
end;

procedure TfrmPrincipal.VENDAPORDATA1Click(Sender: TObject);
begin
  try
    frmSelecionarData := TfrmSelecionarData.Create(Self);
    frmSelecionarData.ShowModal;

    frmRelVendaPorData := TfrmRelVendaPorData.Create(Self);
    frmRelVendaPorData.qryVenda.Close;
    frmRelVendaPorData.qryVenda.ParamByName('DataInicio').AsDate := frmSelecionarData.edtDataInicio.Date;
    frmRelVendaPorData.qryVenda.ParamByName('DataFim').AsDate := frmSelecionarData.edtDataFinal.Date;
    frmRelVendaPorData.qryVenda.Open;
    frmRelVendaPorData.Relatorio.PreviewModal;


  finally
    frmSelecionarData.Release;
    frmRelVendaPorData.Release;
  end;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TfrmAtualizaDB);
begin
  aForm.chkConexaoBD.Checked := True;
  aForm.Refresh;
  Sleep(100);
  dtmPrincipal.qryScriptCategorias.ExecSQL;
  aForm.chkCategoria.Checked := True;
  aForm.Refresh;
  Sleep(100);
  dtmPrincipal.qryScriptClientes.ExecSQL;
  aForm.chkCliente.Checked := True;
  aForm.Refresh;
  Sleep(100);
  dtmPrincipal.qryProdutos.ExecSQL;
  aForm.chkProduto.Checked := True;
  aForm.Refresh;
  Sleep(100);
  dtmPrincipal.qryVendas.ExecSQL;
  aForm.chkVendas.Checked := True;
  aForm.Refresh;
  Sleep(100);
  dtmPrincipal.qryItensVenda.ExecSQL;
  aForm.chkItensVendas.Checked := True;
  aForm.Refresh;
  Sleep(100);
end;

end.
