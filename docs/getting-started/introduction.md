---
layout: docs
title: Introduction
description: Get started with Shopware Bootstrap Theme.
group: getting-started
redirect_from:
  - /docs/getting-started/
  - /docs/
toc: true
---

## Basics

### Why Bootstrap?

The Shopware Bootstrap Theme combines the extensibility of Shopware and the simplicity of Twitter Bootstrap.
With these assets in your pocket, developing innovative themes for e-commerce becomes as easy as never before.

#### Reusable Responsive Components

@media { max-width: 480px; } how was it again? Worry not; Bootstrap already took care of this.
Ready-made classes let you realise your ideas without any effort, for all devices, fully responsive.
We follow Bootstrap's approach – devices are categorised in viewport width ranges,
from extra-small under which most handheld phones fall, to extra-large, like your high resolution desktop.
Never was it more straightforward to stretch that button over a phone's full width,
tuck it into the top-right corner of your tablet, while hiding it completely on your ultra-wide-screen workstation;
that behaviour and much more is just few elementary class names away!

### Extensibility

The Shopware Bootstrap Theme allows for a great amount of configuration,
whether it be just changing few colours here and there or turning the entire shop upside down, everything is possible.
And if it isn't, make it possible. We are open-source; just fork us on GitHub.

## Prerequisites

### Further Reading

Of course, the Shopware Bootstrap Theme is not the solution to all your problems;
instead, a combination of different tools is. Shopware uses a template engine called Smarty for its store front.
Smarty provides a simple and modular structure for your templates - blocks that can be extended and replaced individually,
and in the end, these blocks are combined into a finished web page and shipped to your browser.

Before you get started with developing your own theme based on the Shopware Bootstrap Theme, you should become familiar with Smarty.
Take a look at Shopware's own [Frontend Guides](https://https://developers.shopware.com/designers-guide/),
where the basics of theme and template development are covered.

### System Requirements

To develop a theme based on the Shopware Bootstrap Theme, you need
- Shopware 5.3 or newer
- The Shopware Bootstrap Theme
- _Optionally, you may download our example theme, which covers few of the basics mentioned in this documentation._

#### Development Environment Set-Up

Download and install Shopware as described on the [Download Page of Shopware](http://community.shopware.com/Downloads_cat_448.html).
Alternatively, clone Shopware from it's [GitHub Repository](https://github.com/shopware/shopware) and follow its installation steps
as described in its README-file.
Once you have done this, you have multiple ways to install the Shopware Bootstrap Theme, of which two are covered here.

##### Installation via Plugin-Manager

[Download the latest version of the Shopware Bootstrap Theme as a zip file from its GitHub-Page](https://github.com/conexco/shopware-bootstrap-theme/releases)
Open the backend of your Shopware installation. Press `Ctrl + Alt + P` or navigate to _Configuration_ -> _Plugin Manager_ using the main menu.
In the left side-bar, use the link _Installed_, then upload the zip file you just downloaded using the _Upload plugin_ button in the toolbar.
The plugin should now appear in the list of uninstalled plugins. Click the green plus-sign to install it.

Continue as described in **Using the Shopware Bootstrap Theme**

##### Installation via GitHub on the Command-Line

In the command line, navigate to the root directory of your Shopware installation. Then, execute following commands:
```
git clone https://github.com/conexco/shopware-bootstrap-theme.git custom/plugins/SwfBootstrapTheme
php bin/console sw:plugin:refresh
php bin/console sw:plugin:install SwfBootstrapTheme
php bin/console sw:plugin:activate SwfBootstrapTheme
```

Continue as described in **Using the Shopware Bootstrap Theme**

##### Using the Shopware Bootstrap Theme

After installing the plugin in Shopware, you're going to need to enable the theme in the Theme Manager.
Open the backend of your Shopware installation. Navigate to _Configuration_ -> _Theme Manager_ using the main menu.
Click on the _BootstrapBare_-theme and enable it by clicking the button _Select theme_ in the lower right hand corner.
You will be asked to compile the theme - do so by clicking on _Start process_.
The theme is now activated and you can see it in action in your shop's frontend.

### Structure

In the last step, you may have observed that not one, but two new themes have been added to the Theme Manager.
These are _BootstrapBare_ and _BootstrapAddons_. Their difference is insignificant -
_BootstrapBare_ contains the template files for a bare installation of the Shopware Community Edition,
while _BootstrapAddons_ inherits from _BootstrapBare_ and extends it by the templates for the additional features
of the Shopware Professional and Enterprise Editions. Depending on your needs, you may base your own theme on either of them.
The process of doing so is exactly identical - you just have the opportunity to exclude some unneeded overhead and clutter
if you are using the Community Edition.
