from django.shortcuts import render
from django.views.generic import TemplateView
from .models import Producto

class HomeView(TemplateView):
    template_name = 'index.html'
    def get_context_data(self, **kwargs):
        cont = super(HomeView, self).get_context_data(**kwargs)
        cont['prods'] = Producto.disponiveis.all().order_by('?')[:3]
        return cont
