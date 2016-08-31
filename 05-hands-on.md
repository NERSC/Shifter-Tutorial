# Final Hands-on

## Controlling layers and making builds faster
How you construct your Dockerfile can have a big impact on your image sizes.  Keeping images compact, decreases the time to pull an image down or convert images for use by Shifter.  Here are a few tips to reduce image sizes.

### Cleanup within the construction of a layer
Each RUN statement will result in a new layer.  For example, let's look at the following.

```
RUN wget http://hostname.com/mycode.tgz
RUN tar xzf mycode.tgz
RUN cd mycode ; make; make install
RUN rm -rf mycode.tgz mycode
```

This will result in four layers.  Unfortunately, the cleanup line in the last RUN line will not reduce the amount of data that must be pulled from the Docker registry.  Instead, it will mask or "white-out" the files so they don't appear when executing the image.

In contrast, let's examine the following.

```
RUN wget http://hostname.com/mycode.tgz && \
 tar xzf mycode.tgz && \
 cd mycode && make && make install && \
 rm -rf mycode.tgz mycode
 ```

This image size will be much smaller since the cleanup happens inside the layer construction.  Also, notice the use of "&&" between commands.  This is good practice so that failures are detected and will stop the build.  Using a semi-colon like was done above means that the make could fail but the build would continue on.

## What goes in the image and what should stay out

While Docker doesn't typically impose strict limits on image sizes, larger images are more prone to failure for a variety of reasons.  Some Docker deployments may have limited disk space to store images.  Pulling down large layers can trigger timeouts or other failures.  Here are some best practices to follow.

* Limit image sizes to a few GB.  Avoid exceeding 10GB or more.
* Avoid "Kitchen sink" images that contain extraneous applications or tools
* Limit layer sizes using the technique above
* Avoid including data sets in the image unless they are relatively small and static.  Data can be mapped into the image using volume mounts (-v option).
* Limit images to the specific target applications and only add what is needed to support that application.

## Bring us your problem

If you have completed the exercises and there is time remaining.  We encourage you to try to Docker-ize a real application.  Please, ask the tutorial staff for help.
