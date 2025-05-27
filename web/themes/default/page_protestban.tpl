<table style="width: 101%; margin: 0 0 -2px -2px;">
    <tr>
        <td colspan="3" class="listtable_top"><b>Appeal a Ban</b></td>
    </tr>
</table>
<div id="submit-main">
    {'protest.ban.description1'|t} <a href="index.php?p=banlist">{'protest.ban.description2.view'|t}</a> {'protest.ban.description3'|t}<br />
    {'protest.ban.description4'|t}<br /><br />
    <form action="index.php?p=protest" method="post">
        <input type="hidden" name="subprotest" value="1">
        <table cellspacing='10' width='100%' align='center'>
            <tr>
                <td colspan="3">
                    {'protest.ban.your.details'|t}:	</td>
            </tr>
            <tr>
                <td width="20%">{'protest.ban.type'|t}:</td>
                <td>
                    <select id="Type" name="Type" class="select" style="width: 250px;" onChange="changeType(this[this.selectedIndex].value);">
                        <option value="0">{'general.steam.id'|t}</option>
                        <option value="1">{'general.ipaddress'|t}</option>
                    </select>
                </td>
            </tr>
            <tr id="steam.row">
                <td width="20%">
                    {'protest.ban.your.steamid'|t}<span class="mandatory">*</span>:</td>
                <td>
                    <input type="text" name="SteamID" size="40" maxlength="64" value="{$steam_id}" class="textbox" style="width: 223px;" />
                </td>
            </tr>
            <tr id="ip.row" style="display: none;">
                <td width="20%">
                    {'protest.ban.your.ip'|t}<span class="mandatory">*</span>:</td>
                <td>
                    <input type="text" name="IP" size="40" maxlength="64" value="{$ip}" class="textbox" style="width: 223px;" />
                </td>
            </tr>
            <tr>
                <td width="20%">
                    {'general.name'|t}<span class="mandatory">*</span>:</td>
                <td>
                    <input type="text" size="40" maxlength="70" name="PlayerName" value="{$player_name}" class="textbox" style="width: 223px;" /></td>
            </tr>
            <tr>
                <td width="20%" valign="top">
                    {'protest.ban.rwysbu'|t} <span class="mandatory">*</span>: ({'protest.ban.rwysbu.tips'|t}) </td>
                <td><textarea name="BanReason" cols="30" rows="5" class="textbox" style="width: 223px;">{$reason}</textarea></td>
            </tr>
            <tr>
                <td width="20%">
                    {'general.your.email'|t}<span class="mandatory">*</span>:	</td>
                <td>
                    <input type="text" size="40" maxlength="70" name="EmailAddr" value="{$player_email}" class="textbox" style="width: 223px;" /></td>
            </tr>
            <tr>
                <td width="20%"><span class="mandatory">*</span> = {'general.mandatory.field'|t}</td>
                <td>
                    {sb_button text={'general.submit'|t} class=ok id=alogin submit=true}
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
    <br /><b>{'protest.ban.what.happens'|t}</b><br />
    {'protest.ban.what.happens.description1'|t}<br />
    <b>{'protest.ban.what.happens.description2'|t}
</div>
