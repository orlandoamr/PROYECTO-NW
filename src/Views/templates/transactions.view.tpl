<section class="container">
    <h2>Su historial de transacciones</h2>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr class="bg-secondary fs-5 text-light p-2">
                <th width="15%" class="text-center">Fecha</th>
                <th width="40%" class="text-center">Detalle de la compra</th>
                <th width="40%" class="text-center">Total de la compra</th>
            </tr>
        </thead>
        <tbody>
            {{foreach transactions}}
                <tr class="bg-light text-dark">
                    <th width="15%" class="text-center"> 
                        {{fchtrs}}
                    </th>
                    <th width="20%" class="text-center">
                        {{htprds}}

                    </th>
                    <th width="20%" class="text-center">{{total}}</th>
                </tr>
            {{endfor transactions}}
        </tbody>
    </table>
</section>
