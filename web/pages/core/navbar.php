<?php
global $userbank, $theme;

$navbar = [
     [
        'title' => 'navbar.title.dashboard',
        'endpoint' => 'home',
        'description' => 'navbar.description.dashboard',
        'permission' => true
    ],
    [
        'title' => 'navbar.title.servers',
        'endpoint' => 'servers',
        'description' => 'navbar.description.servers',
        'permission' => true
    ],
    [
        'title' => 'navbar.title.bans',
        'endpoint' => 'banlist',
        'description' => 'navbar.description.bans',
        'permission' => true
    ],
    [
        'title' => 'navbar.title.comms',
        'endpoint' => 'commslist',
        'description' => 'navbar.description.comms',
        'permission' => Config::getBool('config.enablecomms')
    ],
    [
        'title' => 'navbar.title.replayer',
        'endpoint' => 'submit',
        'description' => 'navbar.description.replayer',
        'permission' => Config::getBool('config.enablesubmit')
    ],
    [
        'title' => 'navbar.title.appealban',
        'endpoint' => 'protest',
        'description' => 'navbar.description.appealban',
        'permission' => Config::getBool('config.enableprotest')
    ],
    [
        'title' => 'navbar.title.adminpanel',
        'endpoint' => 'admin',
        'description' => 'navbar.description.adminpanel',
        'permission' => $userbank->is_admin()
    ]
];

$admin = [
    [
        'title' => 'general.admins',
        'endpoint' => 'admins',
        'permission' => ADMIN_OWNER|ADMIN_LIST_ADMINS|ADMIN_ADD_ADMINS|ADMIN_EDIT_ADMINS|ADMIN_DELETE_ADMINS
    ],
    [
        'title' => 'navbar.title.servers',
        'endpoint' => 'servers',
        'permission' => ADMIN_OWNER|ADMIN_LIST_SERVERS|ADMIN_ADD_SERVER|ADMIN_EDIT_SERVERS|ADMIN_DELETE_SERVERS
    ],
    [
        'title' => 'navbar.title.bans',
        'endpoint' => 'bans',
        'permission' => ADMIN_OWNER|ADMIN_ADD_BAN|ADMIN_EDIT_OWN_BANS|ADMIN_EDIT_GROUP_BANS|ADMIN_EDIT_ALL_BANS|ADMIN_BAN_PROTESTS|ADMIN_BAN_SUBMISSIONS
    ],
    [
        'title' => 'navbar.title.comms',
        'endpoint' => 'comms',
        'permission' => ADMIN_OWNER|ADMIN_ADD_BAN|ADMIN_EDIT_OWN_BANS|ADMIN_EDIT_ALL_BANS
    ],
    [
        'title' => 'navbar.title.groups',
        'endpoint' => 'groups',
        'permission' => ADMIN_OWNER|ADMIN_LIST_GROUPS|ADMIN_ADD_GROUP|ADMIN_EDIT_GROUPS|ADMIN_DELETE_GROUPS
    ],
    [
        'title' => 'navbar.title.settings',
        'endpoint' => 'settings',
        'permission' => ADMIN_OWNER|ADMIN_WEB_SETTINGS
    ],
    [
        'title' => 'navbar.title.mods',
        'endpoint' => 'mods',
        'permission' => ADMIN_OWNER|ADMIN_LIST_MODS|ADMIN_ADD_MODS|ADMIN_EDIT_MODS|ADMIN_DELETE_MODS
    ]
];

$active = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);
foreach ($navbar as $key => $tab) {
    $navbar[$key]['state'] = ($active === $tab['endpoint']) ? 'active' : 'nonactive';

    if (!$tab['permission']) {
        unset($navbar[$key]);
    }
}

if ($userbank->is_admin()) {
    $cat = filter_input(INPUT_GET, 'c', FILTER_SANITIZE_SPECIAL_CHARS);
    foreach ($admin as $key => $tab) {
        $admin[$key]['state'] = ($cat === $tab['endpoint']) ? 'active' : '';

        if (!$userbank->HasAccess($tab['permission'])) {
            unset($admin[$key]);
        }
    }
}

$theme->assign('navbar', array_values($navbar));
$theme->assign('adminbar', array_values($admin));
$theme->assign('isAdmin', $userbank->is_admin());
$theme->assign('login', $userbank->is_logged_in());
$theme->assign('username', $userbank->GetProperty("user"));
$available_languages = [];
$lang_dir = __DIR__ . '/../../lang/';

if (is_dir($lang_dir)) {
    $files = scandir($lang_dir);
    foreach ($files as $file) {
        if (pathinfo($file, PATHINFO_EXTENSION) === 'php') {
            $lang_code = pathinfo($file, PATHINFO_FILENAME);
            $lang_file = $lang_dir . $file;

            $lang_data = include($lang_file);
            if (isset($lang_data['language.name'])) {
                $available_languages[] = [
                    'code' => $lang_code,
                    'name' => $lang_data['language.name'],
                    'selected' => ($_SESSION['lang'] ?? 'en') === $lang_code ? 'selected' : ''
                ];
            }
        }
    }
}

$theme->assign('available_languages', $available_languages);
$theme->assign('current_lang', $_SESSION['lang'] ?? 'en');
$theme->display('core/navbar.tpl');
