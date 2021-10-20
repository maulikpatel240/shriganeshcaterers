<div class="file-upload">
                                        <?php
                                        $value_image = $value->image;
                                        $image_upload_wrap_div = ($value_image) ? 'display: none;' : 'display: block;';
                                        $file_upload_content_div = ($value_image) ? 'display: block;' : 'display: none;';
                                        $image_url = ($value_image) ? Yii::$app->urlManager->baseUrl . '/uploads/menu/' . $value_image : '#';
                                        $image_name = ($value_image) ? $value_image : 'Uploaded Image';
                                        ?>
                                        <button class="file-upload-btn btn btn-outline-secondary" type="button" onclick="$('.file-upload-input<?= $key ?>').trigger('click');">Add Image</button>
                                        <div class="image-upload-wrap image-upload-wrap<?= $key ?>" style="<?= $image_upload_wrap_div; ?>">
                                            <?= $form->field($value, "[$key]image")->fileInput(['class' => 'file-upload-input file-upload-input'.$key, 'accept' => 'image/*', 'onchange' => 'readURL(this, \'' . $key . '\');'])->label(false); ?>
                                            <div class="drag-text">
                                                <h3>Drag and drop a file or select add Image</h3>
                                            </div>
                                        </div>
                                        <div class="file-upload-content file-upload-content<?= $key ?>" style="<?= $file_upload_content_div; ?>">
                                            <img class="file-upload-image file-upload-image<?= $key ?>" src="<?= $image_url ?>" alt="your image" />
                                            <div class="image-title-wrap">
                                                <button type="button" onclick="removeUpload('<?= $key ?>')" class="remove-image btn btn-danger">Remove <span class="image-title<?= $key ?>"><?= $image_name ?></span></button>
                                            </div>
                                        </div>
                                    </div>