# deadsfu-binaries

Binary files for deadsfu SFU
When building, deadsfu-binaries must be checked as a child directory of deadsfu.
             
The reason this is used as opposed to committing binaries directly into 'deadsfu' is that binaries and git repos can grow in size very rapidly when changing/iterating binary files lots.


By keeping these binaries seperate, this repo can easily be compacted by:

```bash
rm -rf .git
git add .
git commit -m 'compacting'
git remote add origin https://github.com/x186k/deadsfu-binaries.git
git branch -M main
git push -u origin main
```

I was using git LFS, but lots of builds will quickly use up your github LFS quota,
and that disables LFS. This seemed better for this reason.