<?php

namespace SwfBootstrapTheme\Subscribers\Frontend;

use Enlight\Event\SubscriberInterface;

class Checkout implements SubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_Frontend_Checkout_AjaxQuantityCart' => 'onAjaxQuantityCart',
        ];
    }


    /**
     * creates the ajaxQuantityCartAction, same logic as quantityAction
     *
     * returns the ajaxCart
     *
     * @param \Enlight_Event_EventArgs $args
     *
     * @throws \Enlight_Exception
     */
    public function onAjaxQuantityCart(\Enlight_Event_EventArgs $args)
    {
        $args->setProcessed(true);

        /** @var \Enlight_Controller_Action $subject */
        $subject = $args->get('subject');
        $request = $subject->Request();

        $basketItemID = (int) $request->getParam('sArticle');
        $quantity = (int) $request->getParam('sQuantity');

        if ($basketItemID && $quantity) {
            $subject->View()->assign('sBasketInfo', Shopware()->Modules()->Basket()->sUpdateArticle($basketItemID, $quantity));
        }
        $subject->forward('ajaxCart');
    }
}