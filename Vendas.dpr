program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'datamodule\uDTMConexao.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategorias in 'cadastro\uCadCategorias.pas' {frmCadCategorias},
  uEnum in 'heranca\uEnum.pas',
  cCadCategoria in 'classes\cCadCategoria.pas',
  uCadCliente in 'cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'classes\cCadCliente.pas',
  uCadProduto in 'cadastro\uCadProduto.pas' {frmCadProdutos},
  cCadProduto in 'classes\cCadProduto.pas',
  uFrmAtualizaDB in 'datamodule\uFrmAtualizaDB.pas' {frmAtualizaDB},
  uDTMVenda in 'datamodule\uDTMVenda.pas' {dtmVenda: TDataModule},
  uProVendas in 'processo\uProVendas.pas' {frmProVendas},
  cProVendas in 'classes\cProVendas.pas',
  cControleEstoque in 'classes\cControleEstoque.pas',
  uRelCadClienteFicha in 'relatorio\uRelCadClienteFicha.pas' {frmRelCadClienteFicha},
  uRelProVenda in 'relatorio\uRelProVenda.pas' {frmRelProVenda},
  uRelCadCliente in 'relatorio\uRelCadCliente.pas' {frmRelCadCliente},
  uRelCategoria in 'relatorio\uRelCategoria.pas' {frmRelCategoria},
  uRelProduto in 'relatorio\uRelProduto.pas' {frmRelProduto},
  uSelecionarData in 'relatorio\uSelecionarData.pas' {frmSelecionarData},
  uRelProdutoCategoria in 'relatorio\uRelProdutoCategoria.pas' {frmRelProdutoCategoria},
  uRelVendaPorData in 'relatorio\uRelVendaPorData.pas' {frmRelVendaPorData},
  uFuncaoCriptografia in 'heranca\uFuncaoCriptografia.pas',
  uCadUsuario in 'cadastro\uCadUsuario.pas' {frmCadUsuario},
  cCadUsuario in 'classes\cCadUsuario.pas',
  uLogin in 'login\uLogin.pas' {frmLogin},
  Enter in 'terceiros\Enter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
