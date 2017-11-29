<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <ul class="layui-nav layui-nav-tree site-demo-nav">
            <li class="layui-nav-item layui-nav-itemed">
                <a href="../admin/index.action">后台首页</a>
            </li>
		<#list menus as mlist>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">${mlist.name}</a>
                <dl class="layui-nav-child">
					<#list mlist.menuList as clist>
                        <dd>
                            <a href="../${clist.url}">${clist.name}</a>
                        </dd>
					</#list>
                </dl>
            </li>
		</#list>
            <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
        </ul>
    </div>
</div>