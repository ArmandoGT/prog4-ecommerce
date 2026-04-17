from decimal import Decimal

from django.conf import settings

from catalogo.models import Produto


class Carrinho(object):

    def __init__(self, request):
        """
        Inicializa o carrinho de compras
        :param request: a requisição https
        """
        self.session = request.session
        carrinho = self.session.get(settings.CAR_SESSION_ID)
        if not carrinho:
            carrinho = self.session[settings.CAR_SESSION_ID] = {}
        self.carrinho = carrinho

    def addProduto(self, produto, quant=1, alterarquant=False):
        """
        Adiciona um produto ao carrinho ou atualiza a quantidade
        :param produto: O item a ser adicionado
        :param quant: a quantidade do produto
        :param alterarquant: quando necessário alterar a quantidade de produtos
        :return: sem retorno
        """
        idprod = str(produto.id)
        if idprod not in self.carrinho:
            self.carrinho[idprod] = {"quantidade": 0, "preco": str(produto.preco)}
        if alterarquant:
            self.carrinho[idprod]["quantidade"] = quant
        else:
            self.carrinho[idprod]["quantidade"] += quant
        self._salvar()

    def _salvar(self):
        """
        Salva o estado da sessão carrinho
        :return: sem retorno
        """
        self.session.modified = True

    def removerProduto(self, produto):
        """
        Remove um produto do carrinho
        :param produto: o produto que deseja remover
        :return: sem retorno
        """
        idprod = str(produto.id)
        if idprod in self.carrinho:
            del self.carrinho[idprod]
            self._salvar()

    def __iter__(self):
        """
        Percorre os itens do carrinho obtendo informações importantes
        :return: as informações do carrinho
        """
        idsprod = self.carrinho.keys()
        produtos = Produto.objects.filter(id__in=idsprod)
        carrinho = self.carrinho.copy()
        for p in produtos:
            carrinho[str(p.id)]["produto"] = p
        for item in carrinho.values():
            item["preco"] = Decimal(item["preco"])
            item["valor_total"] = item["preco"] * item["quantidade"]
            # o yield não para a execução do metodo retornando item por item
            yield item

    def __len__(self):
        """
        Soma todas as quantidades dos itens do carrinho
        :return: quantidade total de itens
        """
        return sum(item["quantidade"] for item in self.carrinho.values())

    def get_preco_total(self):
        return sum(
            Decimal(item["preco"] * item["quantidade"])
            for item in self.carrinho.values()
        )

    def limpar_carrinho(self):
        del self.session[settings.CAR_SESSION_ID]
        self._salvar()
