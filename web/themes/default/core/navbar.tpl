<div id="tabsWrapper">
    <div id="mainwrapper">
        <div id="tabs">
            <ul>
                {foreach from=$navbar item=nav}
                    <li class="{$nav.state}">
                        <a href="index.php?p={$nav.endpoint}&lang={$current_lang}" class="tip" title="{$nav.title|t}::{$nav.description|t}" target="_self">{$nav.title|t}</a>
                    </li>
                {/foreach}
            </ul>
            <div id="nav">
                {if $isAdmin}
                    {foreach from=$adminbar item=admin}
                        <a class="nav_link {$admin.state}" href="index.php?p=admin&c={$admin.endpoint}">{$admin.title|t}</a>
                    {/foreach}
                {/if}
            </div>
            {if $login}
            <div style="float: right;">
                <ul>
                    <li>
                        <a style="background-color: #B8383B;" href='index.php?p=logout'>Logout</a>
                    </li>
                </ul>
            </div>
            <div class="user">Welcome, <a href='index.php?p=account'>{$username}</a></div>
            {else}
            <div style="float: right;">
                <ul>
                    <li>
                        <a style="background-color: #70B04A;" href='index.php?p=login'>Login</a>
                    </li>
                </ul>
            </div>
            {/if}
            <div style="float: right; margin-left: 10px;">
                <form method="get" id="lang-switcher" style="display:inline;">
                    <select name="lang" onchange="this.form.submit()">
                        <option value="en" {if $current_lang == 'en'}selected{/if}>English</option>
                        <option value="zh_CN" {if $current_lang == 'zh_CN'}selected{/if}>简体中文</option>
                    </select>
                    {foreach from=$smarty.get key=key item=val}
                        {if $key != 'lang'}
                            <input type="hidden" name="{$key}" value="{$val|escape}" />
                        {/if}
                    {/foreach}
                </form>
            </div>
        </div>
    </div>
</div>
<div id="mainwrapper">
    <div id="innerwrapper">
