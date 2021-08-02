<section class="container">
    <h2>Su carrito de compra</h2>
    {{test}}
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr class="bg-secondary fs-5 text-light p-2">
                <th width="40%">Descripción</th>
                <th width="15%" class="text-center">Cantidad</th>
                <th width="20%" class="text-center">Precio</th>
                <th width="20%" class="text-center">Total</th>
                <th width="5%">--</th>
            </tr>
        </thead>
        <tbody>
            {{foreach items}}
                <tr class="bg-light text-dark">
                    <th width="40%">{{desc}}</th>
                    <th width="15%" class="d-flex justify-content-evenly w-100"> 
                        {{cant}}

                    </th>
                    <th width="20%" class="text-center">L.{{price}}</th>
                    <th width="20%" class="text-center">L.{{total}}</th>
                    <th width="5%">
                        <form action="index.php?page=cart" method="post">
                            <input type="hidden" name="id" id="id" value="{{id}}">
                            <button class="btn btn-danger" 
                                name="btnAction" 
                                value="rem" 
                                type="submit">
                                Quitar
                            </button>
                        </form>
                    </th>
                </tr>
            {{endfor items}}
            <tr>
                <th width="25%" class="fs-3">Total del carrito</th>
                <th colspan="4" width="25%" class="text-center fs-3">L.{{total_cart}}</th>
            </tr>
            <tr>
                <th colspan="5" width="25%" class="text-center ">
                    <form action="index.php?page=checkout_checkout" method="POST">
                        <button class="btn btn-primary btn-lg fs-3" type="submit">Continuar</button>
                    </form>
                </th>
            </tr>
        </tbody>
    </table>
</section>
