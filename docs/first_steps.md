---
layout: default
title: First Steps
description: Creating your first custom theme
---

# First Steps

## In-Depth Structure

The Shopware Bootstrap Theme consists of a quite high number of files,
and in order to not to get lost completely in its vast structure, here is a short orientation.

### Plugin Structure

The Shopware Bootstrap Theme is in fact a theme wrapped in a plugin,
and therefore located in the `/custom/plugins`-Directory of your Shopware installation unlike regular themes in the `/themes`-Directory.
While Shopware themes work exactly the same no matter in which of these directories they are located in,
having a theme wrapped in a plugin is beneficial, because it allows for easy updates and versioning of the theme.

The structure of a plugin is quite simple.
It is covered in-depth in the [Shopware Documentation](https://developers.shopware.com/developers-guide/plugin-system/),
but here is a short summary of the relevant bits for theme development.

The minimal directory structure for a plugin containing a theme is following:

```
MyPlugin
├──themes
│  └──Frontend
│     └──MyTheme
│        └──...
├──plugin.xml
└──MyPlugin.php
```
whereby the names `MyPlugin` and `MyTheme` are up to your choice.

#### Explanation

As you can see, the plugin's directory structure is quite simple. It should be after all, because it's only a wrapper for a theme.
The only files in your plugin that are not part of the theme itself are `plugin.xml` and `MyPlugin.php`, whereby `plugin.xml`
holds meta-data like the plugin's version, description and changelog, and `MyPlugin.php` consists of installation routines -
something we can safely neglect at the moment.

As this guide is mainly about theme development, we won't cover the plugin structure in-depth. If you want to read more about it,
please refer to [Shopware's Developer Guides](https://developers.shopware.com/developers-guide/plugin-system/)

#### Example

**MyPlugin.php**
```php
namespace MyPlugin\MyPlugin;

use Shopware\Components\Plugin;

class MyPlugin extends Plugin
{
}
```

**plugin.xml**
```xml
<?xml version="1.0" encoding="utf-8"?>
<plugin xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="https://raw.githubusercontent.com/shopware/shopware/5.2/engine/Shopware/Components/Plugin/schema/plugin.xsd">
    <label lang="en">My New Theme</label>
    <label lang="de">Mein Neues Theme</label>

    <version>1.0.0</version>
    <link>http://example.org</link>
    <author>conexco</author>
    <compatibility minVersion="5.3.0" />

    <changelog version="1.0.0">
        <changes lang="en">Initial release</changes>
        <changes lang="de">Initiales Release</changes>
    </changelog>
</plugin>
```

### Theme Structure

The `themes`-Directory is structured in the same way as the `themes`-Directory in Shopware itself.
Likewise, once the plugin is installed and activated, its contents are treated identically.

Shopware's main `themes`-directory consists of one `Frontend` and one `Backend` directory.
As the name suggests, the `Backend` directory contains templates for the Shop administration.
Consequently, our custom theme only contains a `Frontend`-directory.

In above example, the `Frontend`-directory contains one single directory - this is our Theme.
Theoretically, you can ship as many Themes as you like in one single plugin;
the Shopware Bootstrap Theme makes use of that mechanic with the _BootstrapBare_ and _BootstrapExtension_ themes.

The minimal directory structure of a theme is
```
MyTheme
└──Theme.php
```

If you can't think of anything else than floating question marks right now
and are asking yourself why there is only one file to be found here, let me explain!

Just like the `plugin.xml` in a plugin, the `Theme.php` in a theme contains basic information about its name,
author and its license. Also, this is the place where you define which theme yours is going to inherit from,
and where you can perform some elementary configuration.

#### Example

```php
<?php
// The deepest level of the namespace is identical with your theme's name
namespace Shopware\Themes\MyTheme;

use Doctrine\Common\Collections\ArrayCollection;
use Shopware\Components\Form as Form;
use Shopware\Components\Theme\ConfigSet;

class Theme extends \Shopware\Components\Theme
{
    /** @var string Defines the parent theme */
    protected $extend = 'BootstrapBare';

    /** @var string Defines the human readable name */
    protected $name = 'My Theme';

    /** @var string Description of the theme */
    protected $description = 'An example theme';

    /** @var string The author of the theme */
    protected $author = 'conexco';

    /** @var string License of the theme */
    protected $license = 'MIT';
}
```

### Template Directory Structure

Most template files are named after the controller action that renders said template
For example, the `cartAction` in the `Checkout`-controller renders the template `frontend/checkout/cart.tpl`.
The rest of template files are either extended from a template loaded by a controller action,
or included into one as a reusable component, for example the main menu.

## Creating Our First Theme

Let's get our hands dirty and create our first theme.
Suppose we sell only a handful of different products, all of which are advertised on the front page of our shop.
We decide to remove the search bar in the page header and move our logo into the header's centre.

Let's start with the search bar.

We know the search bar is visible on every page within the shop (well, except during the checkout process),
in the shop header. We can therefore assume that the template for the search bar is probably included in one of the templates
in the `frontend/index`-Directory. Just by looking at the file names in there, we can pinpoint the search bar's location
quite accurately.

```
/var/www/Shopware/custom/plugins/SwfBootstrapTheme/Themes/Frontend/BootstrapBare/frontend/index $ ls
breadcrumb.tpl
footer_minimal.tpl
footer-navigation.tpl
footer.tpl
header.tpl
index.tpl
logo-container.tpl
main-navigation.tpl
script-async-ready.tpl
search.tpl
shop-navigation.tpl
sidebar-categories.tpl
sidebar.tpl
sites-navigation.tpl
```
One of the files is called `search.tpl`. That sounds exactly like what we're looking for.
A quick look inside tells us that the entire search container, along with a form that wraps the input element,
is located inside the file. If we manage to stop including it in the header file, it shouldn't appear any more.
