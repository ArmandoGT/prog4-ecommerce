from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect

from django.views import View
from django.views.generic import ListView, CreateView, TemplateView
from utils.my_mixins import GeraPDFMixin

from carrinho.car import Carrinho
from .models import Pedido, ItemPedido
from .forms import PedidoModelForm


class PedidoCreateView(LoginRequiredMixin, CreateView):
    model = Pedido
    form_class = PedidoModelForm
    template_name = 'pedido/novopedido.html'

    def form_valid(self, form):
        car = Carrinho(self.request)
        pedido = form.save(commit=False)
        usuario = self.request.user
        pedido.cliente = usuario
        pedido.save()
        for item in car:
            ItemPedido.objects.create(
                pedido = pedido,
                produto=item['produto'],
                preco_unit=item['preco'],
                quantidade=item['quantidade'],
            )
        car.limpar_carrinho()
        self.request.session['idpedido'] = pedido.id
        return redirect('resumopedido', idpedido=pedido.id)


class ResumoPedidoTemplateView(LoginRequiredMixin, TemplateView):
    template_name = 'pedido/resumopedido.html'

    def get_context_data(self, **kwargs):
        cont = super().get_context_data(**kwargs)
        cont['pedido'] = Pedido.objects.get(id=self.kwargs['idpedido'])
        return cont


class PedidoListView(LoginRequiredMixin, ListView):
    model = Pedido
    template_name = 'pedido/meuspedidos.html'
    context_object_name = 'pedidos'

    def get_queryset(self):
        return Pedido.objects.filter(cliente=self.request.user)


class ListaPedidosPDF(View, GeraPDFMixin):

    def get(self, request, *args, **kwargs):
        pedidos = Pedido.objects.filter(cliente=self.request.user)
        context = {'pedidos': pedidos, 'usuario': self.request.user}
        return self.gerarPDF('pedido/meuspedidospdf.html',
                             context)



