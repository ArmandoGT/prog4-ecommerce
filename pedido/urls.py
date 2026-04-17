from django.urls import path
from . import views

urlpatterns = [
    path('novo/', views.PedidoCreateView.as_view(),
         name='novopedido'),
    path('meuspedidos/', views.PedidoListView.as_view(),
         name='meuspedidos'),
    path('pdfmeuspedidos/', views.ListaPedidosPDF.as_view(),
         name='meuspedidospdf'),
    path('resumo/<int:idpedido>', views.ResumoPedidoTemplateView.as_view(),
         name='resumopedido'),
]