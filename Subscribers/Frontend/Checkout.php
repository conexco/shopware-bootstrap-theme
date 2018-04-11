<?php

namespace SwfBootstrapTheme\Subscribers\Frontend;

use Enlight\Event\SubscriberInterface;
use Shopware\Components\ContainerAwareEventManager;

class Checkout implements SubscriberInterface
{
    /**
     * @var ContainerAwareEventManager
     */
    private $eventManager;


    public function __construct(ContainerAwareEventManager $eventManager)
    {
        $this->eventManager = $eventManager;
    }


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

        $basketItemID = (int)$request->getParam('sArticle');
        $quantity = (int)$request->getParam('sQuantity');

        if ($basketItemID && $quantity) {
            $cancelUpdate = $this->eventManager->notifyUntil(
                'BootstrapTheme_AjaxQuantityCart_UpdateBasketItem',
                [
                    'subject' => $subject,
                    'basketItemID' => $basketItemID,
                    'quantity' => $quantity,
                ]);

            if (!$cancelUpdate) {
                $subject->View()->assign('sBasketInfo', Shopware()->Modules()->Basket()->sUpdateArticle($basketItemID, $quantity));
            }
        }
        $subject->forward('ajaxCart');
    }
}