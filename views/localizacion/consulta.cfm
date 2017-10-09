<style type="text/css">
    .scroll {
    height: 300px;
    overflow: scroll;

}
textarea {
   resize: none;
}
</style>
<cfprocessingdirective pageEncoding="utf-8">    

<cfinclude template="consulta_js.cfm">
<div class="row">
    <div class="col-md-12">
        <cfoutput>
        <div class="ibox-content text-center">
            <h1>#prc.res.NOMBRE#</h1>
            <div class="m-b-sm">
                <img alt="image" class="img-circle" src="/includes/img/restaurantes/#prc.res.RFC#.jpg">
            </div>
            <p class="font-bold">#prc.direccion#</p>
            
            <p class="font-bold"><b>Contacto</b></p>

            <p class="font-bold">#prc.res.email#</p>

             
                

            <!---- ------>
          <cfinclude template="raiting.cfm">
            <!------ -------->
            <div class="panel-body">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a data-toggle="collapse" data-parent="##accordion" href="##collapseOne">Comentarios</a>
                            </h5>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body scroll">
                                <div class="feed-activity-list">
                                        <cfoutput>
                                            <cfloop query="#prc.comentarios#">
                                                <div class="feed-element">
                                                    
                                                        <img   alt="icono" class="img-circle pull-left" src="/includes/img/comentario/comentario.png">
                                                   
                                                    <div class="media-body ">
                                                        <small class="pull-right"><cfloop from="1" to="#PUNTAJE#" index="i">✬</cfloop></small>
                                                        <div class="text-left">
                                                        <strong>#NOMBREUSUARIO#</strong>
                                                    
                                                        <br> 
                                                        #OBSERVACION# 
                                                        </div>
                                                        <!---<br>---->
                                                        <!---<small class="text-muted">Today 5:60 pm - 12.06.2014</small>---->
                                                    </div>
                                                </div>
                                            </cfloop>
                                        </cfoutput>           
                                </div>
                                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---<cfoutput>
                 #getInstance( "MessageBox@cbmessagebox" ).renderIt()#
            </cfoutput>---->
            <div class="text-center">
                <!--- Mensaje de error --->
           <!--- <cfoutput>
                 #getInstance( "MessageBox@cbmessagebox" ).renderIt()#
            </cfoutput>--->
            <!----<div class="text-center">
                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> Like </a>
                <a class="btn btn-xs btn-primary"><i class="fa fa-heart"></i> Love</a>
            </div>---->
            <!---
                <button class="btn btn-success">Agregar comentario</button>
            <div class="text-center">---->
                <div class="chat-form">
                            <form role="form"  action="/index.cfm/restaurante/restaurante/agregarComentario" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value=<cfoutput>"#prc.id#"</cfoutput>>
                               </div>
                                <div class="form-group">
                                    <textarea name="comentario" class="form-control" maxlength="200" placeholder="Agregar comentario" required=""></textarea>
                                </div>

                                    <!---- ----->
                             <div class="text-left">       
                                 <div class="star-ratings start-ratings-main clearfix">
                                    <div class="stars stars-example-fontawesome">
                                         <select id="puntuacion" name="raiting" autocomplete="off">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>  
                                </div>
                            </div>
                            <div class="text-right">
                                    <!---- ----->
                                <button type="submit" class="btn btn-sm btn-primary m-t-n-xs"><strong>Enviar</strong></button>
                            </div>
                            </form>
                </div>
        </div>
        </cfoutput>
    </div>
</div>


