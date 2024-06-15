import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'qwvnac25': {
      'en': 'Enter your credentials to access your account.',
      'fr': 'Entrez vos identifiants pour accéder à votre compte.',
    },
    'eno5jji0': {
      'en': 'Sign In',
      'fr': 'Se connecter',
    },
    'cqanau65': {
      'en': 'Email Address',
      'fr': 'Adresse e-mail',
    },
    'a81feh9p': {
      'en': '',
      'fr': '',
    },
    'o3n4ic2o': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'hxmhbjp1': {
      'en': '',
      'fr': '',
    },
    't09i1513': {
      'en': 'Sign In',
      'fr': 'Se connecter',
    },
    'rpa7ge5c': {
      'en': 'Forgot Password?',
      'fr': 'Mot de passe oublié?',
    },
    '1z611047': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
    },
    'hx1g7lry': {
      'en': 'Email Address',
      'fr': 'Adresse e-mail',
    },
    'emvwivhu': {
      'en': '',
      'fr': '',
    },
    'ggcla6vd': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'dbh7rhm5': {
      'en': '',
      'fr': '',
    },
    'wfpsv30y': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
    },
    '7vbr8i14': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'isystq8l': {
      'en': 'Email address should be minimum 5 characters',
      'fr': 'L\'adresse e-mail doit comporter au minimum 5 caractères',
    },
    '0vvbu09f': {
      'en': 'email address is too long',
      'fr': 'l\'adresse email est trop longue',
    },
    'qop6wibf': {
      'en': 'Email seems to be invalid. Please check',
      'fr': 'L\'e-mail semble invalide. Vérifiez s\'il vous plaît',
    },
    'rue6zvif': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '37rryjnp': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '8piv4jhh': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
  },
  // forgotPassword
  {
    'hxvbak62': {
      'en': 'Back',
      'fr': 'Dos',
    },
    'l3ffx6ol': {
      'en': 'Back',
      'fr': 'Dos',
    },
    '8zwi85aj': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    'htldi9x5': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez saisir l\'e-mail associé à votre compte ci-dessous.',
    },
    '4xr86erm': {
      'en': 'Email Addresss',
      'fr': 'Adresses e-mail',
    },
    'x6a0tjhe': {
      'en': 'Enter your email...',
      'fr': 'Entrer votre Email...',
    },
    '5nmgpcud': {
      'en': 'Send Link',
      'fr': 'Envoyer un lien',
    },
    'b7qwhofj': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // createProfile
  {
    'u10qm9xc': {
      'en': 'Create Profile',
      'fr': 'Créer un profil',
    },
    'ym74n59b': {
      'en': 'Full Name',
      'fr': 'Nom et prénom',
    },
    'pb3kx2zr': {
      'en': 'Title or Role',
      'fr': 'Titre ou rôle',
    },
    'l5thzdz7': {
      'en': 'Enter description here..',
      'fr': 'Entrez la description ici..',
    },
    'uh616rg5': {
      'en': 'Create ',
      'fr': 'Créer et inviter un utilisateur',
    },
    'afrmdqrj': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'r4jjk1p5': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '04dgho3r': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'ymmlv0wk': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
  },
  // Main_tracker
  {
    'c1qxdya3': {
      'en': 'Dashboard',
      'fr': 'Bonjour',
    },
    '3r436ae2': {
      'en': 'Create Task',
      'fr': 'Créer une tâche',
    },
    'd2j80kse': {
      'en': 'Not Started',
      'fr': 'Pas commencé',
    },
    'z74dbd2l': {
      'en': 'Start',
      'fr': 'Commencer',
    },
    'jdlbtk11': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    '7e9dqfqq': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    'jjg57xms': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'j0oiwmp5': {
      'en': 'Issue #242952592',
      'fr': 'Numéro 242952592',
    },
    '6o3lsajf': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    '01ha8j0f': {
      'en': 'Andres Reynolds',
      'fr': 'Andrés Reynolds',
    },
    'y26xuhtz': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'fwvgvs6j': {
      'en': 'Tuesday, 10:00am',
      'fr': 'mardi, 10h00',
    },
    'z7prh3m7': {
      'en': 'Complete',
      'fr': 'Complet',
    },
    'wucfb81x': {
      'en': 'Complete',
      'fr': 'Complet',
    },
    'hmbjinl1': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'gt3i6vre': {
      'en': 'My Tasks',
      'fr': 'Mes tâches',
    },
    '0ap24imz': {
      'en': '(4)',
      'fr': '(4)',
    },
    'um26zdq2': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'c2byz5t2': {
      'en': 'Issue #242952592',
      'fr': 'Numéro 242952592',
    },
    'ggk3pvhb': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    'cncx7jin': {
      'en': 'Andres Reynolds',
      'fr': 'Andrés Reynolds',
    },
    'kphqfzdx': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'su1h7291': {
      'en': 'Tuesday, 10:00am',
      'fr': 'mardi, 10h00',
    },
    'a8dvaipa': {
      'en': 'Not Started',
      'fr': 'Pas commencé',
    },
    'e922rfdn': {
      'en': 'Start',
      'fr': 'Commencer',
    },
    '8v08ly9a': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'z282r5c8': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    'neyxlkmi': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'i8wfk1ux': {
      'en': 'Issue #242952592',
      'fr': 'Numéro 242952592',
    },
    '5iihifce': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    '9uojrl5p': {
      'en': 'Andres Reynolds',
      'fr': 'Andrés Reynolds',
    },
    '76g3ujku': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'jbghesji': {
      'en': 'Tuesday, 10:00am',
      'fr': 'mardi, 10h00',
    },
    '2gtfroxg': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'dwywy7ca': {
      'en': 'Tracker',
      'fr': 'Traqueur',
    },
  },
  // createTask_1_SelectProject
  {
    'f85b93hp': {
      'en': 'Create Task',
      'fr': 'Créer une tâche',
    },
    'xrpl9hvp': {
      'en': 'Don\'t see your project? Add one here.',
      'fr': 'Vous ne voyez pas votre projet ? Ajoutez-en un ici.',
    },
    'qqgmosbw': {
      'en': 'Add Project',
      'fr': 'Ajouter un projet',
    },
    '1mum6ndw': {
      'en': 'Last edited:',
      'fr': 'Dernière modification :',
    },
    'm8ysqbkb': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'av2mxnkv': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    's4v9wdh0': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '2h7d3sa4': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
  },
  // createTask
  {
    '6xlyz7ip': {
      'en': 'Create Task',
      'fr': 'Créer une tâche',
    },
    'roszfzar': {
      'en': 'Task Name',
      'fr': 'Nom de la tâche',
    },
    'q5urswg7': {
      'en': 'Enter description here...',
      'fr': 'Entrez la description ici...',
    },
    'r6ixpgb1': {
      'en': 'Not Started',
      'fr': 'Pas commencé',
    },
    'yhk1wcin': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    'vmyuapjy': {
      'en': 'Complete',
      'fr': 'Complet',
    },
    'mn12jc9y': {
      'en': 'Select Status',
      'fr': 'Sélectionnez le statut',
    },
    'w9fpc2yv': {
      'en': 'Create Task',
      'fr': 'Créer une tâche',
    },
    'a9ob4e0d': {
      'en': 'Please add a task name.',
      'fr': 'Veuillez ajouter un nom de tâche.',
    },
    'zyaj8zh3': {
      'en': 'Please enter at least 3 letters.',
      'fr': 'Veuillez saisir au moins 3 lettres.',
    },
    'cnh6ti8v': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'cgmduzhe': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'i71iwd10': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // taskDetails
  {
    'mziw6hrx': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'ct9x0xhk': {
      'en': 'Team Members',
      'fr': 'Membres de l\'équipe',
    },
    'rmqtfldi': {
      'en': 'Notes & Activity',
      'fr': 'Notes et activité',
    },
    '44malkle': {
      'en': 'Mark as Complete',
      'fr': 'Marquer comme terminé',
    },
    'vl73t8fn': {
      'en': 'Begin Task',
      'fr': 'Commencer la tâche',
    },
    'dedxptmm': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // addTeamMembers
  {
    'suwf7ulx': {
      'en': 'Invite User',
      'fr': 'Inviter un utilisateur',
    },
    'yxrotcmk': {
      'en': 'Full Name',
      'fr': 'Nom et prénom',
    },
    'vygdbm69': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    '6k2ab5w0': {
      'en': 'Title or Role',
      'fr': 'Titre ou rôle',
    },
    '32dmyve3': {
      'en': 'Team 1',
      'fr': 'Équipe 1',
    },
    '01901xti': {
      'en': 'Team 2',
      'fr': 'Équipe 2',
    },
    'z0f1h62m': {
      'en': 'Team 3',
      'fr': 'Équipe 3',
    },
    'iwtz644e': {
      'en': 'Select Team',
      'fr': 'Choisis une équipe',
    },
    '4w07g5md': {
      'en': 'Enter description here..',
      'fr': 'Entrez la description ici..',
    },
    '3nvs6sds': {
      'en': 'Create & Invite User',
      'fr': 'Créer et inviter un utilisateur',
    },
    'y51v7ocx': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'hg6cv6or': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'kdgu1oif': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'gvat9zso': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
  },
  // teamMemberDetails
  {
    'yhae4rja': {
      'en': 'Team Bio',
      'fr': 'Biographie de l\'équipe',
    },
    'khsg4cbl': {
      'en': 'Tasks',
      'fr': 'Tâches',
    },
    'a3ch1tw5': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'ow74ie9d': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Main_projectsWeb
  {
    'd7aguiwl': {
      'en': 'Projects',
      'fr': 'Projets',
    },
    '684745v9': {
      'en': 'A list of your projects below.',
      'fr': 'Une liste de vos projets ci-dessous.',
    },
    'a7i21l37': {
      'en': 'Create Project',
      'fr': 'Créer un projet',
    },
    'ay7vx0uv': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Main_teamPage
  {
    'ebzkdd32': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    '6hdhegux': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    '0i6nxydx': {
      'en': 'Search members...',
      'fr': 'Rechercher des membres...',
    },
    'qj1mz4sh': {
      'en': 'Find Members',
      'fr': 'Trouver des membres',
    },
    'wp42n8lb': {
      'en': 'Created on',
      'fr': 'Créé sur',
    },
    'i2tjwysy': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
  },
  // Main_projects
  {
    '2o9a9zhb': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // myProfile
  {
    'qqi5z7oe': {
      'en': 'Switch to Dark Mode',
      'fr': 'Passer en mode sombre',
    },
    'vnltbvcs': {
      'en': 'Switch to Light Mode',
      'fr': 'Passer en mode lumière',
    },
    'djrg60ro': {
      'en': 'Account Settings',
      'fr': 'Paramètres du compte',
    },
    'w9jz25xv': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'f9c1n9qo': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
    },
    '9ioazwbz': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    'xvg8y0h1': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // createProject
  {
    'eico9jlb': {
      'en': 'Create Project',
      'fr': 'Créer un projet',
    },
    '03zfnuph': {
      'en': 'Project Name',
      'fr': 'nom du projet',
    },
    '20jzfsvr': {
      'en': 'Enter description here...',
      'fr': 'Entrez la description ici...',
    },
    'xd6ci26k': {
      'en': 'Create Project',
      'fr': 'Créer un projet',
    },
    'fjmcu2kb': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'td8jzwik': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'sbcj9c6l': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '0xe8j0k2': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
  },
  // projectDetailsPage
  {
    '27l7y5jo': {
      'en': 'View All',
      'fr': 'Voir tout',
    },
    'hbvwoyp5': {
      'en': 'Completed Tasks',
      'fr': 'Tâches terminées',
    },
    'bwul9qxo': {
      'en': 'Number of Tasks',
      'fr': 'Nombre de tâches',
    },
    'b7js3qj0': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    '93jlzw34': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    '8kjtoxx8': {
      'en': 'Issue #242952592',
      'fr': 'Numéro 242952592',
    },
    'nqvonzvt': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    '4u5mcl35': {
      'en': 'Andres Reynolds',
      'fr': 'Andrés Reynolds',
    },
    'mbdn6xkt': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'l4f2hvvr': {
      'en': 'Tuesday, 10:00am',
      'fr': 'mardi, 10h00',
    },
    'bbosu6bh': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    'vx59bduu': {
      'en': 'Complete',
      'fr': 'Complet',
    },
    'cibliqdj': {
      'en': 'Completed on',
      'fr': 'Terminé le',
    },
    's3410mg4': {
      'en': 'Activity',
      'fr': 'Activité',
    },
    'u74nb5eq': {
      'en': 'Current Time',
      'fr': 'Heure actuelle',
    },
    '4yjrayhp': {
      'en': 'Back',
      'fr': 'Dos',
    },
    'wa8b8lm1': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // searchMembers
  {
    'r9ilya9c': {
      'en': 'Add Members',
      'fr': 'Ajouter des membres',
    },
    'q9q7yvdo': {
      'en': 'Search members...',
      'fr': 'Rechercher des membres...',
    },
    '1xy4hdeo': {
      'en': 'Search Memebers',
      'fr': 'Rechercher des membres',
    },
    'smwdet6x': {
      'en': 'Assign',
      'fr': 'Attribuer',
    },
    'ewyx52zp': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // editProfile
  {
    '4d3ywbq0': {
      'en': 'Change Photo',
      'fr': 'Changer la photo',
    },
    'nzf1rcao': {
      'en': 'Your Name',
      'fr': 'votre nom',
    },
    'hbr9z9is': {
      'en': 'Title or Role',
      'fr': 'Titre ou rôle',
    },
    'dpn0lo3j': {
      'en': 'Your bio',
      'fr': 'Votre biographie',
    },
    'sk49y1qh': {
      'en': 'Email associated with this account:',
      'fr': 'Email associé à ce compte :',
    },
    '224did3m': {
      'en': 'Save Changes',
      'fr': 'Sauvegarder les modifications',
    },
    'k7pi6kw2': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
    },
  },
  // teamMembers
  {
    'ryuvea9f': {
      'en': 'Add Members',
      'fr': 'Ajouter des membres',
    },
    'fd92zyzh': {
      'en': 'Members in Project',
      'fr': 'Membres du projet',
    },
    'mejjwqjk': {
      'en': 'Remove',
      'fr': 'Retirer',
    },
    '63ic1fnq': {
      'en': 'UserName',
      'fr': 'Nom d\'utilisateur',
    },
    'qgzfhziv': {
      'en': 'Remove',
      'fr': 'Retirer',
    },
    '3bpxqjgs': {
      'en': 'UserName',
      'fr': 'Nom d\'utilisateur',
    },
    'jgcnmem7': {
      'en': 'Remove',
      'fr': 'Retirer',
    },
    'sowwtsvq': {
      'en': 'Add Members',
      'fr': 'Ajouter des membres',
    },
    '0ok0v50s': {
      'en': 'Assign',
      'fr': 'Attribuer',
    },
    '65pxldwf': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'm9kt6uxu': {
      'en': 'View',
      'fr': 'Voir',
    },
    'guuh2xpo': {
      'en': 'Username',
      'fr': 'Nom d\'utilisateur',
    },
    'ugypxfpp': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'dg9pkn40': {
      'en': 'View',
      'fr': 'Voir',
    },
    'o12upobw': {
      'en': 'Username',
      'fr': 'Nom d\'utilisateur',
    },
    'aa053iut': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'e0w36luv': {
      'en': 'View',
      'fr': 'Voir',
    },
    '3igetaqg': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    '1bw0vdj6': {
      'en': 'View',
      'fr': 'Voir',
    },
    's6igz4en': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // editProject
  {
    'jq4uhlra': {
      'en': 'Edit Project',
      'fr': 'Modifier le projet',
    },
    '9zmy4gf2': {
      'en': 'Project Name',
      'fr': 'nom du projet',
    },
    'vvovb81m': {
      'en': 'Enter description here...',
      'fr': 'Entrez la description ici...',
    },
    'kv2q1duq': {
      'en': 'Save Changes',
      'fr': 'Sauvegarder les modifications',
    },
    '2ogqedzz': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '7mi6k17d': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'v97b3f8d': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'jn3gy9p2': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
  },
  // drawerNav
  {
    'gnxpb2ai': {
      'en': 'View',
      'fr': 'Voir',
    },
    '8f8t2vli': {
      'en': 'Tracker',
      'fr': 'Traqueur',
    },
    'an74qqfr': {
      'en': 'Projects',
      'fr': 'Projets',
    },
    '963xee2s': {
      'en': 'Team',
      'fr': 'Équipe',
    },
    'qajspfhy': {
      'en': 'About',
      'fr': 'À propos',
    },
    'xu1ntpz9': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
  },
  // addTeam
  {
    'vt3uv50f': {
      'en': 'Assign Member',
      'fr': 'Attribuer un membre',
    },
    'abde9rd0': {
      'en': 'Find members by searching below to add them to this task.',
      'fr':
          'Trouvez des membres en recherchant ci-dessous pour les ajouter à cette tâche.',
    },
    'iv874nug': {
      'en': 'Search members...',
      'fr': 'Rechercher des membres...',
    },
    'st02dqz2': {
      'en': 'Assign',
      'fr': 'Attribuer',
    },
    'p75vssyl': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'tdxwxubt': {
      'en': 'View',
      'fr': 'Voir',
    },
    '70px8lqm': {
      'en': 'Username',
      'fr': 'Nom d\'utilisateur',
    },
    '65m6ok9u': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'tbpcs9yt': {
      'en': 'View',
      'fr': 'Voir',
    },
    '43aer1df': {
      'en': 'Username',
      'fr': 'Nom d\'utilisateur',
    },
    'xg5j0bll': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'wh4ez88i': {
      'en': 'View',
      'fr': 'Voir',
    },
    'b88csebc': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'j5p839jn': {
      'en': 'View',
      'fr': 'Voir',
    },
  },
  // createNote
  {
    'ckgzpqno': {
      'en': 'Create Note',
      'fr': 'Créer une note',
    },
    'vwrwr1zv': {
      'en': 'Create a note to keep your team in the loop.',
      'fr': 'Créez une note pour tenir votre équipe au courant.',
    },
    'ictixy2n': {
      'en': 'Enter your note here...',
      'fr': 'Entrez votre note ici...',
    },
    '5rej5r1z': {
      'en': 'Create Note',
      'fr': 'Créer une note',
    },
  },
  // TaskComponent
  {
    'sivbddzo': {
      'en': 'Completed',
      'fr': 'Complété',
    },
  },
  // WebNav
  {
    'ejq9ngok': {
      'en': 'Tracker',
      'fr': '',
    },
    'sf7j88cj': {
      'en': 'Projects',
      'fr': '',
    },
    'sp6916kl': {
      'en': '3',
      'fr': '3',
    },
    'cgkc0jyt': {
      'en': 'Team Members',
      'fr': '',
    },
    'usxg96la': {
      'en': 'Team Members',
      'fr': '',
    },
  },
  // changePhoto
  {
    'rsuprvvk': {
      'en': 'Change Photo',
      'fr': 'Changer la photo',
    },
    '52ofropw': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'fr':
          'Téléchargez une nouvelle photo ci-dessous afin de changer votre avatar vu par les autres.',
    },
    'bc31m25z': {
      'en': 'Upload Image',
      'fr': 'Télécharger une image',
    },
    'tralhz2q': {
      'en': 'Save Changes',
      'fr': 'Sauvegarder les modifications',
    },
  },
  // modal_Project
  {
    'b3tmb94w': {
      'en': 'View All',
      'fr': 'Voir tout',
    },
    '6p3cfcop': {
      'en': 'Completed Tasks',
      'fr': 'Tâches terminées',
    },
    '53v52enf': {
      'en': 'Number of Tasks',
      'fr': 'Nombre de tâches',
    },
    'e1yfytdt': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    'bj5sn810': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'idueoryh': {
      'en': 'Issue #242952592',
      'fr': 'Numéro 242952592',
    },
    'lo6bi8am': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    '3tnn1niq': {
      'en': 'Andres Reynolds',
      'fr': 'Andrés Reynolds',
    },
    'aeur7shi': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    'dhvgcq6k': {
      'en': 'Tuesday, 10:00am',
      'fr': 'mardi, 10h00',
    },
    '0yxp4dtr': {
      'en': 'Completed',
      'fr': 'Complété',
    },
    's2h1tnyx': {
      'en': 'Complete',
      'fr': 'Complet',
    },
    '43vzosc9': {
      'en': 'Completed on',
      'fr': 'Terminé le',
    },
    'z0rvlkv3': {
      'en': 'Activity',
      'fr': 'Activité',
    },
    '0rv99lbn': {
      'en': 'Current Time',
      'fr': 'Heure actuelle',
    },
  },
  // modal_TaskDetails
  {
    '60d7bmkn': {
      'en': 'Mark as Complete',
      'fr': 'Marquer comme terminé',
    },
    '6cjlcaxu': {
      'en': 'Begin Task',
      'fr': 'Commencer la tâche',
    },
    'vvhpevfy': {
      'en': 'Due',
      'fr': 'Exigible',
    },
    '9onx1ch9': {
      'en': ', ',
      'fr': ',',
    },
    '0jviqdml': {
      'en': 'Team Members',
      'fr': 'Membres de l\'équipe',
    },
    '4b2i6hhe': {
      'en': 'Activity',
      'fr': 'Activité',
    },
    'qxy1zirz': {
      'en': 'Leave update here...',
      'fr': 'Laissez la mise à jour ici...',
    },
    'e5aeph79': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
  },
  // modal_UserProfile
  {
    'n27jr1hg': {
      'en': 'Team Bio',
      'fr': 'Biographie de l\'équipe',
    },
    'xf490hul': {
      'en': 'Tasks',
      'fr': 'Tâches',
    },
    'y5t25owh': {
      'en': 'Due',
      'fr': 'Exigible',
    },
  },
  // modal_TaskCreate_1
  {
    'k9o51k72': {
      'en': 'Choose Project',
      'fr': 'Choisir un projet',
    },
    'wga1c3sp': {
      'en': 'Don\'t see your project? Add one here.',
      'fr': 'Vous ne voyez pas votre projet ? Ajoutez-en un ici.',
    },
    'nsxihmta': {
      'en': 'Add Project',
      'fr': 'Ajouter un projet',
    },
    '5dkwg5r0': {
      'en': 'Last edited:',
      'fr': 'Dernière modification :',
    },
    '2fm4p66b': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'btzyzf3x': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '4f44s6pa': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'z8dw1hpi': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
  },
  // modal_CreateProject
  {
    'ivyuedf1': {
      'en': 'Create Project',
      'fr': 'Créer un projet',
    },
    'dtxn6zzi': {
      'en': 'Please add the name & description below.',
      'fr': 'Veuillez ajouter le nom et la description ci-dessous.',
    },
    'pmrgulyt': {
      'en': 'Project Name',
      'fr': 'nom du projet',
    },
    'g8iltq8h': {
      'en': 'Enter description here...',
      'fr': 'Entrez la description ici...',
    },
    'rs4m3qu7': {
      'en': 'Create Project',
      'fr': 'Créer un projet',
    },
    'rxy1hzw9': {
      'en': 'Please enter a project name.',
      'fr': 'Veuillez saisir un nom de projet.',
    },
    'l2w0uvkc': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '3hfkufri': {
      'en': 'Please enter a short description.',
      'fr': 'Veuillez saisir une brève description.',
    },
    'mtk7i9t7': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // modal_TaskCreate_2
  {
    'kh10ruu8': {
      'en': 'Task Name',
      'fr': 'Nom de la tâche',
    },
    'wm2k8we7': {
      'en': 'Enter description here...',
      'fr': 'Entrez la description ici...',
    },
    '973t9zby': {
      'en': 'Not Started',
      'fr': 'Pas commencé',
    },
    'h6sbabuq': {
      'en': 'In Progress',
      'fr': 'En cours',
    },
    'g5tvhiqo': {
      'en': 'Complete',
      'fr': 'Complet',
    },
    'eb9slo6n': {
      'en': 'Select Status',
      'fr': 'Sélectionnez le statut',
    },
    'n8wkz77p': {
      'en': 'Create Task',
      'fr': 'Créer une tâche',
    },
    'ul3a8lyi': {
      'en': 'Please add a task name.',
      'fr': 'Veuillez ajouter un nom de tâche.',
    },
    'lve3ry0a': {
      'en': 'Please enter at least 3 letters.',
      'fr': 'Veuillez saisir au moins 3 lettres.',
    },
    'wpyenq7x': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'l9m3ge71': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'fpaeaf3d': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // modal_Activity
  {
    'g8n75qfd': {
      'en': 'Notifications',
      'fr': 'Notifications',
    },
    'xddmuioh': {
      'en': 'Project:',
      'fr': 'Projet:',
    },
  },
  // modal_addMembers
  {
    'g7weubso': {
      'en': 'Add Members to project',
      'fr': 'Ajouter des membres au projet',
    },
    '13tf8xms': {
      'en': 'Members in Project',
      'fr': 'Membres du projet',
    },
    'v4qbfvpn': {
      'en': 'Remove',
      'fr': 'Retirer',
    },
    'al1y3gg2': {
      'en': 'UserName',
      'fr': 'Nom d\'utilisateur',
    },
    '2kr9iaxf': {
      'en': 'Remove',
      'fr': 'Retirer',
    },
    '2ix1upsk': {
      'en': 'UserName',
      'fr': 'Nom d\'utilisateur',
    },
    'tjbe7tuc': {
      'en': 'Remove',
      'fr': 'Retirer',
    },
    'djp0jjxt': {
      'en': 'Add Members',
      'fr': 'Ajouter des membres',
    },
    'ay6uchzn': {
      'en': 'Assign',
      'fr': 'Attribuer',
    },
    '04gswf7l': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    '88n7n0dy': {
      'en': 'View',
      'fr': 'Voir',
    },
    'zj1ooqek': {
      'en': 'Username',
      'fr': 'Nom d\'utilisateur',
    },
    'dmxcz88y': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'jf5fwdvr': {
      'en': 'View',
      'fr': 'Voir',
    },
    '60cr99sc': {
      'en': 'Username',
      'fr': 'Nom d\'utilisateur',
    },
    'o0iqx7l5': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'v2z11d1d': {
      'en': 'View',
      'fr': 'Voir',
    },
    'x9y1d9fu': {
      'en': 'user@domainname.com',
      'fr': 'utilisateur@nom de domaine.com',
    },
    'gu3vykzw': {
      'en': 'View',
      'fr': 'Voir',
    },
  },
  // Miscellaneous
  {
    'tuf7ywhd': {
      'en': 'Label',
      'fr': 'Étiquette',
    },
    'z2zi1qq5': {
      'en': 'Button',
      'fr': 'Bouton',
    },
    'qm71wpil': {
      'en': 'Button',
      'fr': 'Bouton',
    },
    'fi5o91qd': {
      'en': '',
      'fr': '',
    },
    'skzc79wn': {
      'en': '',
      'fr': '',
    },
    '0rnqst8h': {
      'en': '',
      'fr': '',
    },
    'nh43oztv': {
      'en': '',
      'fr': '',
    },
    'i4m03gv7': {
      'en': '',
      'fr': '',
    },
    '9h5b120r': {
      'en': '',
      'fr': '',
    },
    '2xxt8j1o': {
      'en': '',
      'fr': '',
    },
    't7udujpl': {
      'en': '',
      'fr': '',
    },
    'zbbv93d3': {
      'en': '',
      'fr': '',
    },
    'lvg9hjf0': {
      'en': '',
      'fr': '',
    },
    'fve7lx80': {
      'en': '',
      'fr': '',
    },
    'jxwjrono': {
      'en': '',
      'fr': '',
    },
    '2nuridg7': {
      'en': '',
      'fr': '',
    },
    'cql4rcil': {
      'en': '',
      'fr': '',
    },
    't9vh67yu': {
      'en': '',
      'fr': '',
    },
    'ac2c7a8c': {
      'en': '',
      'fr': '',
    },
    '43t0g3v5': {
      'en': '',
      'fr': '',
    },
    'hxsgfsan': {
      'en': '',
      'fr': '',
    },
    'zuih46g4': {
      'en': '',
      'fr': '',
    },
    '8oo00kio': {
      'en': '',
      'fr': '',
    },
    'f4h7j5e1': {
      'en': '',
      'fr': '',
    },
    'dka0mr3o': {
      'en': '',
      'fr': '',
    },
    'a9x09f52': {
      'en': '',
      'fr': '',
    },
    'gn6bmhck': {
      'en': '',
      'fr': '',
    },
    'b9gx9zp0': {
      'en': '',
      'fr': '',
    },
    '3ogdlxsd': {
      'en': '',
      'fr': '',
    },
    'uxmsgxy2': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
