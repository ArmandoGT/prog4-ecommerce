from decimal import Decimal

from django.conf import settings
from catalogo.models import Producto

class Carrinho(object):
    def __init__(self, request):

        self.session = request.session
        carrinho = self.session.get(settings.CAR_SESSION_ID)
        if not carrinho:
            carrinho = self.session[settings.CAR_SESSION_ID]
        self.carrinho = carrinho

    def addProducto(self, producto, quant=1, alterarquant=False):

        idProducto = str(producto.id)
        if idProducto not in self.carrinho:
            self.carrinho[idProducto] = {"quantidade": 0, "preco":str(producto.preco)}
        if alterarquant:
            self.carrinho[idProducto]["quantidade"] = quant
        else:
            self.carrinho[idProducto]["quantidade"] += quant
        self._salvar()

    def _salvar(self):
        self.carrinho.modified = True

    def __iter__(self):

        idsprod = self.carrinho.keys()
        produtos = Producto.objects.filter(id__in=idsprod)
        carrinho = self.carrinho.copy()
        for produto in produtos:
            carrinho[str(p.id)]["produto"] = p
        for item in carrinho.values():
            item["preco"] = Decimal(item["preco"])
            item["valor_total"] = item["preco"] * item["quantidade"]
            yield item

    def __len__(self):
        return sum(item["quantidade"] for item in self.carrinho.values())

    def get_preco_total(self):
        return sum(
            Decimal(item["preco"] * item["quantidade"])
            for item in self.carrinho.values()
        )

    def limpar_carrinho(self):
        del self.session[settings.CAR_SESSION_ID]
        self._salvar()



