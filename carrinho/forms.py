from django import forms


class CarrinhoForm(forms.Form):
    # PRODUTO_QUANT = [(i,str(i)) for i in range(1,21)]
    # quant = forms.TypedChoiceField(choices=PRODUTO_QUANT, coerce=int)
    quant = forms.IntegerField(
        widget=forms.NumberInput(attrs={"min_value":"1", "max_value":"20", "class":"quant_itens"})
    )
    alterar = forms.BooleanField(required=False, initial=False,
                                 widget=forms.HiddenInput)