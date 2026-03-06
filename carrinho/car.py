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



