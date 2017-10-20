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

### Theme Structure

The `themes`-Directory is structured in the same way as the `themes`-Directory in Shopware itself
