<?php

namespace Tests\Feature\Http\Controllers\Admin;

use App\Models\Price;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use JMac\Testing\Traits\AdditionalAssertions;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

/**
 * @see \App\Http\Controllers\Admin\PriceController
 */
final class PriceControllerTest extends TestCase
{
    use AdditionalAssertions, RefreshDatabase, WithFaker;

    #[Test]
    public function index_displays_view(): void
    {
        $prices = Price::factory()->count(3)->create();

        $response = $this->get(route('price.index'));

        $response->assertOk();
        $response->assertViewIs('price.index');
        $response->assertViewHas('prices');
    }


    #[Test]
    public function create_displays_view(): void
    {
        $response = $this->get(route('price.create'));

        $response->assertOk();
        $response->assertViewIs('price.create');
    }


    #[Test]
    public function store_uses_form_request_validation(): void
    {
        $this->assertActionUsesFormRequest(
            \App\Http\Controllers\Admin\PriceController::class,
            'store',
            \App\Http\Requests\Admin\PriceStoreRequest::class
        );
    }

    #[Test]
    public function store_saves_and_redirects(): void
    {
        $price = $this->faker->randomFloat(/** decimal_attributes **/);

        $response = $this->post(route('price.store'), [
            'price' => $price,
        ]);

        $prices = Price::query()
            ->where('price', $price)
            ->get();
        $this->assertCount(1, $prices);
        $price = $prices->first();

        $response->assertRedirect(route('price.index'));
        $response->assertSessionHas('price.id', $price->id);
    }


    #[Test]
    public function show_displays_view(): void
    {
        $price = Price::factory()->create();

        $response = $this->get(route('price.show', $price));

        $response->assertOk();
        $response->assertViewIs('price.show');
        $response->assertViewHas('price');
    }


    #[Test]
    public function edit_displays_view(): void
    {
        $price = Price::factory()->create();

        $response = $this->get(route('price.edit', $price));

        $response->assertOk();
        $response->assertViewIs('price.edit');
        $response->assertViewHas('price');
    }


    #[Test]
    public function update_uses_form_request_validation(): void
    {
        $this->assertActionUsesFormRequest(
            \App\Http\Controllers\Admin\PriceController::class,
            'update',
            \App\Http\Requests\Admin\PriceUpdateRequest::class
        );
    }

    #[Test]
    public function update_redirects(): void
    {
        $price = Price::factory()->create();
        $price = $this->faker->randomFloat(/** decimal_attributes **/);

        $response = $this->put(route('price.update', $price), [
            'price' => $price,
        ]);

        $price->refresh();

        $response->assertRedirect(route('price.index'));
        $response->assertSessionHas('price.id', $price->id);

        $this->assertEquals($price, $price->price);
    }


    #[Test]
    public function destroy_deletes_and_redirects(): void
    {
        $price = Price::factory()->create();

        $response = $this->delete(route('price.destroy', $price));

        $response->assertRedirect(route('price.index'));

        $this->assertModelMissing($price);
    }
}
