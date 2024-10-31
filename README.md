# rock-vrl-church
Tim created this repository in order to contain all the things about VRL's Rock implementation that could be shared externally and collaborated on.

I like the idea of [CodeTour](https://code.visualstudio.com/learn/educators/codetour), this is a VSC Extension that will allow the code author to give you a "tour" of their code. Essentially, it's like adding comments to your code, but differently. I will try to get in the habit of creating CodeTours for codes that could be confusing without context/explanation. ([VSC Marketplace: CodeTour Extension](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour))

# How to Use this Repository
1. The [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) is recommended.
2. The [CodeTour](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour) Extension is recommended.
3. Inside the `_code` Folder,
   1. the Folders where the name begins with an underline (e.g. the `_attachments` Folder) is akin to footnotes or margin-notes.
   2. the other Folders try to denote an Entity or Context where the code snippet is used.
      - For the sake of making it easier to navigate in GitHub, each Folder should have its own README.
      - Each Lava file should start with a comment block that denotes where this snippet is being used. See 'Lava Header Examples' below.

# Lava Header Examples
It used to be that I would have an example boilerplate for the files in this GitHub repo, and a separate example boilerplate for files you'd find in Rock.

Now, it's the same boilerplate regardless of whether it's a file here in this GitHub repo or in Rock.

The only discretion necessary is whether you'd use the multi-line [Lava comment syntax](https://community.rockrms.com/lava/tags/comment-tags), or whether you'd use the multi-line commment syntax of some other language. I say default to using the Lava comment syntax, but if you're in a context where it's safer to use the comment syntax of another language, simply use the syntax of the language that won't cause trouble.

## Examples
```
/---------------------------------------------------------------------------------------------------------
    This Lava is found in
    PageId=1128, BLockId=6222, [Block.Name] > [Block.ConfigurationSection] > Block.ConfigurationField
    
    This Lava is used to mimic the Group List Personalized Lava Block type. However, rather than showing a list of Groups where CurrentPerson is the Leader, it shows a list of Groups where CurrentPerson is the Coach.
    This Lava requires the 'Sql' Lava commands enabled.
    
    Path:
    _code/Block-HTMLContent/CoachingGroups_PageId1128/BlockId6222-ListOfCoachingGroups.lava
---------------------------------------------------------------------------------------------------------/
```

If the Lava file was created by copy+pasting an existing Lava Template (maybe it was written by SparkDev or Triumph in core Rock), then please make note of it like this:
```
/---------------------------------------------------------------------------------------------------------
    This Lava is found in
    PageId=1128, BLockId=6222, [Block.Name] > [Block.ConfigurationSection] > Block.ConfigurationField
    
    I am copy+pasting this here from the VRL Rock Site.
    I copy+pasted this on 09-APR-2024
    
    Path:
    _code/Block-HTMLContent/CoachingGroups_PageId1128/BlockId6222-ListOfCoachingGroups.lava
---------------------------------------------------------------------------------------------------------/
```

<hr>