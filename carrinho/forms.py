from django import forms

class CarrinhoForm(forms.Form):
    PRODUTO_QUANT = [(i,str(i)) for i in range(1,21)]
    quant = forms. TypedChoiceField(choices=PRODUTO_QUANT, coerce=int)
    alterar = forms.BooleanField(required=False, initial=False, widget=forms.HiddenInput)
