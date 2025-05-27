<table style="width: 101%; margin: 0 0 -2px -2px;">
    <tr>
        <td colspan="3" class="listtable_top"><b>{'submit.ban.report'|t}</b></td>
    </tr>
</table>
<div id="submit-main">
    {'submit.ban.description1'|t}<br />
    {'submit.ban.description2'|t}<br />
    {'submit.ban.description3'|t}
    <a href="javascript:void(0)" onclick="ShowBox('{'submit.ban.description6.help.title'|t}', '{'submit.ban.description7.help.sporptv'|t}<br /><br /> {'submit.ban.description8.help.recorddemos'|t}', 'blue', '', true);">{'submit.ban.description4.help'|t}</a> {'submit.ban.description5.help'|t}<br /><br />
    <form action="index.php?p=submit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="subban" value="1">
        <table cellspacing='10' width='100%' align='center'>
            <tr>
                <td colspan="3">
                    {'ban.list.bandetails'|t}:	</td>
            </tr>
            <tr>
                <td width="20%">
                    {'submit.ban.players.steamid'|t}:</td>
                <td>
                    <input type="text" name="SteamID" size="40" maxlength="64" value="{$STEAMID}" class="textbox" style="width: 250px;" />
                </td>
            </tr>
            <tr>
                <td width="20%">
                    {'submit.ban.players.ip'|t}:</td>
                <td>
                    <input type="text" name="BanIP" size="40" maxlength="64" value="{$ban_ip}" class="textbox" style="width: 250px;" />
                </td>
            </tr>
            <tr>
                <td width="20%">
                    {'submit.ban.players.nickname'|t}<span class="mandatory">*</span>:</td>
                <td>
                    <input type="text" size="40" maxlength="70" name="PlayerName" value="{$player_name}" class="textbox" style="width: 250px;" /></td>
            </tr>
            <tr>
                <td width="20%" valign="top">
                    {'submit.ban.reason'|t}<span class="mandatory">*</span>:<br />
                    {'submit.ban.reason.tips'|t}	</td>
                <td><textarea name="BanReason" cols="30" rows="5" class="textbox" style="width: 250px;">{$ban_reason}</textarea></td>
            </tr>
            <tr>
                <td width="20%">
                    {'submit.ban.your.name'|t}:	</td>
                <td>
                    <input type="text" size="40" maxlength="70" name="SubmitName" value="{$subplayer_name}" class="textbox" style="width: 250px;" />	</td>
            </tr>

            <tr>
                <td width="20%">
                    {'general.your.email'|t}<span class="mandatory">*</span>:	</td>
                <td>
                    <input type="text" size="40" maxlength="70" name="EmailAddr" value="{$player_email}" class="textbox" style="width: 250px;" />	</td>
            </tr>
            <tr>
                <td width="20%">
                    {'navbar.title.servers'|t}<span class="mandatory">*</span>:	</td>
                <td colspan="2">
                    <select id="server" name="server" class="select" style="width: 277px;">
                        <option value="-1">-- {'submit.ban.select.server'|t} --</option>
                        {foreach from=$server_list item="server"}
                            <option value="{$server.sid}" {if $server_selected == $server.sid}selected{/if}>{$server.hostname}</option>
                        {/foreach}
			<option value="0">{'submit.ban.oseornolh'|t}</option>
		</select> 
    </td>
    </tr>
<tr>
	<td width="20%">
		{'submit.ban.upload.demo'|t}:	</td>
	<td>
		<input name="demo_file" type="file" size="25" class="file" style="width: 268px;" /><br />
		{'submit.ban.upload.demo.note'|t}
    </tr>
<tr>
	<td width="20%"><span class="mandatory">*</span> = {'general.mandatory.field'|t}</td>
	<td>
		{sb_button text={'general.submit'|t} onclick="" class=ok id=save submit=true}
	</td>
    <td>&nbsp;</td>
</tr>
</table>
</form>
<b>{'submit.ban.what.happens'|t}</b><br />
{'submit.ban.what.happens.description'|t}
</div>
