<?php

namespace yiiunit\extensions\bootstrap5;

use yii\bootstrap5\Alert;

/**
 * Tests for Alert widget
 *
 * @group bootstrap5
 */
class AlertTest extends TestCase
{
    public function testNormalAlert()
    {
        Alert::$counter = 0;
        $html = Alert::widget([
            'body' => '<strong>Holy guacamole!</strong> You should check in on some of those fields below.',
            'options' => [
                'class' => ['alert-warning']
            ]
        ]);

        $expectedHtml = <<<HTML
<div id="w0" class="alert-warning alert alert-dismissible" role="alert">

<strong>Holy guacamole!</strong> You should check in on some of those fields below.
<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>
HTML;

        $this->assertEqualsWithoutLE($expectedHtml, $html);
    }

    /**
     */
    public function testDismissibleAlert()
    {
        Alert::$counter = 0;
        $html = Alert::widget([
            'body' => "Message1",
        ]);

        $expectedHtml = <<<HTML
<div id="w0" class="alert alert-dismissible" role="alert">

Message1
<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>
HTML;
        $this->assertEqualsWithoutLE($expectedHtml, $html);
    }
}
