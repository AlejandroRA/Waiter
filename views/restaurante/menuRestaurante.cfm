<style type="text/css">
   .scroll {
    height: 650px;
    overflow: scroll;
}
</style>
<cfprocessingdirective pageEncoding="utf-8">    

<div class="row">
	<div class="col-lg-12">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <cfoutput>
                            <cfloop query="#prc.categorias#">
                                <cfif currentRow GT 1>
                                     <li class=""><a data-toggle="tab" href="##tab-#ID#" ><i class="fa fa-tags" aria-hidden="true"></i> #NOMBRE#</a></li>
                                <cfelse>
                                     <li class="active"><a data-toggle="tab" href="##tab-#ID#"><i class="fa fa-tags" aria-hidden="true"></i> #NOMBRE#</a></li>
                                </cfif>
                            </cfloop>
                            </cfoutput>
                        </ul>
                        <div class="tab-content">
                            <cfoutput>
                                <cfloop query="#prc.categorias#">
                                    <cfset name_category=NOMBRE>
                                    <cfif currentRow GT 1>
                                        <div id="tab-#ID#" class="tab-pane ">
                                    <cfelse>
                                        <div id="tab-#ID#" class="tab-pane active">
                                    </cfif>
                                            <div class="panel-body scroll">
                                                <div class="row">
                                                <cfloop query="#prc.platillos[ID]#">
                                                    <div class="col-md-4">
                                                        <div class="ibox">
                                                            <div class="ibox-content product-box">
                                                                <div class="product-imitation">
                                                                    <img alt="image" class="img-rounded" width="260" height="260" src="/includes/img/platillos/#prc.rfc#/#name_category#/#replace(NOMBRE_P,' ','_','ALL')#.jpg">
                                                                </div>
                                                                <div class="product-desc">
                                                                    <span class="product-price">
                                                                    $ #PRECIO#
                                                                    </span>
                                                                    <small class="text-muted">#name_category#</small>
                                                                    <a href="" class="product-name"> #NOMBRE_P#</a>
                                                                    <div class="small m-t-xs">
                                                                        #DESCRIPCION#
                                                                    </div>
                                                                    <!---<div class="m-t text-righ">
                                                                        <a href="##" class="btn btn-xs btn-outline btn-primary">Info <i class="fa fa-long-arrow-right"></i> </a>
                                                                    </div>---->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </cfloop>
                                                </div>
                                            </div> 
                                        </div>
                                </cfloop>
                            </cfoutput>          
                    	</div>
        			</div>
    </div>
</div>