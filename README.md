# sfu1-binaries

Binary files for sfu1 SFU, must be checked out side by side with sfu1.

The reason this is used as opposed to putting binaries directly inside of 'sfu1' is that binaries and git repos can grow in size very rapidly when changing/iterating binary files lots.
This repo can easily be compacted by:

```bash
rm -rf .git
git add .
git commit -m 'compacting'
git remote add origin https://github.com/x186k/sfu1-binaries.git
git branch -M main
git push -u origin main
```

I was using git LFS, but lots of builds will quickly use up your github LFS quota,
and that disables LFS. This seemed better for this reason.