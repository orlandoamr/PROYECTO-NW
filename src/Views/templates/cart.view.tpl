<section class="container">
    <h2>Su carrito de compra</h2>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th width="40%">Descripción</th>
                <th width="15%" class="text-center">Cantidad</th>
                <th width="20%" class="text-center">Precio</th>
                <th width="20%" class="text-center">Total</th>
                <th width="5%">--</th>
            </tr>
        </thead>
        <tbody>
            {{foreach cart_items}}
                <tr>
                    <th width="40%">{{desc}}</th>
                    <th width="15%" class="text-center">1</th>
                    <th width="20%" class="text-center">{{price}}</th>
                    <th width="20%" class="text-center">{{price}}</th>
                    <th width="5%">
                        <form action="index.php?page=cart" method="post">
                            <input type="hidden" name="id" id="id" value="{{id}}">
                            <button class="btn btn-danger" 
                                name="btnAccion" 
                                value="rem" 
                                type="submit">
                                Quitar
                            </button>
                        </form>
                    </th>
                </tr>
            {{endfor cart_items}}
            <tr>
                <th width="25%" class="fs-3">Total del carrito</th>
                <th colspan="4" width="25%" class="text-center fs-3">L.{{total_cart}}</th>
            </tr>
            <tr>
                <th colspan="5" width="25%" class="text-center fs-3"><button class="btn-primary">Continuar</button></th>
            </tr>
        </tbody>
    </table>
</section>
