abstract class UsinasInterface {
  Future cadastrarNovaUsina(usina, context);
  Future getUsinaToEdit(id, context);
  Future getItensDaUsina(id, context);
  Future getServicosDaUsina(id, context);
  Future alterarUsina(id, usinaToUpdate, context);
}
